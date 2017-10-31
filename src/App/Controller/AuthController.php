<?php

namespace App\Controller;

use Cartalyst\Sentinel\Checkpoints\ThrottlingException;
use Respect\Validation\Validator as V;
use Slim\Http\Request;
use Slim\Http\Response;

class AuthController extends Controller
{
    public function login(Request $request, Response $response)
    {
        if ($request->isPost()) {
            $credentials = [
                'username' => $request->getParam('username'),
                'password' => $request->getParam('password')
            ];
            $remember = $request->getParam('remember', false);

            try {
                if ($this->auth->authenticate($credentials, $remember)) {
                    $this->flash('success', 'You are now logged in.');
                    return $this->redirect($response, 'profile');
                } else {
                    $this->validator->addError('auth', 'Bad username or password!');
                }
            } catch (ThrottlingException $e) {
                $this->validator->addError('auth', 'Too many attempts!');
            }
        }

        return $this->view->render($response, 'Auth/login.twig');
    }

    public function register(Request $request, Response $response)
    {
        if ($request->isPost()) {
            $username = $request->getParam('username');
            $email = $request->getParam('email');
            $password = $request->getParam('password');
            $first_name = $request->getParam('first_name');
            $last_name = $request->getParam('last_name');
            $birthdate = $request->getParam('birthdate');
            $city = $request->getParam('city');
            $country = $request->getParam('country');
            
            $this->validator->request($request, [
                'username' => [
                    'rules' => V::length(3, 25)->alnum('_')->noWhitespace(),
                    'messages' => [
                        'noWhitespace' => 'Username shouldn\'t contain any white spaces.',
                        'alnum' => 'Username must contain only letters (a-z), digits (0-9) and "_".',
                        'length' => 'Username should be 3 to 25 characters long.'
                    ]
                ],
                'password' => [
                    'rules' => V::noWhitespace()->length(6, 25),
                    'messages' => [
                        'length' => 'The password length must be between {{minValue}} and {{maxValue}} characters.',
                        'noWhitespace' => 'The password shouldn\'t contain any white spaces.'
                    ]
                ],
                'password_confirm' => [
                    'rules' => V::equals($password),
                    'messages' => [
                        'equals' => 'Passwords don\'t match.'
                    ]
                ],
                'email' => [
                    'rules' => V::email(),
                    'messages' => [
                        'email' => 'The email entered is not of a correct email format.'
                    ]
                ],
                'first_name' => [
                    'rules' => V::length(1, 25)->alpha()->noWhitespace(),
                    'messages' => [
                        'noWhitespace' => 'First name shouldn\'t contain any white spaces.',
                        'alpha' => 'First name needs to contains alpha characters only.',
                        'length' => 'First name should be 1 to 25 characters long.'
                    ]
                ],
                'last_name'=> [
                    'rules' => V::length(1, 25)->alpha(),
                    'messages' => [
                        'alpha' => 'Last name needs to contains alpha characters only.',
                        'length' => 'Last name should be 1 to 25 characters long.'
                    ]
                ],
                'city' => [
                    'rules' => V::length(1, 25)->alpha()->noWhitespace(),
                    'messages' => [
                        'noWhitespace' => 'City shouldn\'t contain any white spaces.',
                        'alpha' => 'City needs to contains alpha characters only.',
                        'length' => 'City should be 1 to 25 characters long.'
                    ]
                ],
                'country' => [
                    'rules' => V::length(1, 25)->alpha()->noWhitespace(),
                    'messages' => [
                        'noWhitespace' => 'Country shouldn\'t contain any white spaces.',
                        'alpha' => 'Country needs to contains alpha characters only.',
                        'length' => 'Country should be 1 to 25 characters long.'
                    ]
                ],
                'birthdate' => [
                    'rules' => V::Date('Y-m-d'),
                    'messages' => [
                        'date' => 'Birthdate : Please use the Y-m-d format. Ex: 2000-01-31'
                    ]
                ],
            ]);

            if ($this->auth->findByCredentials(['login' => $username])) {
                $this->validator->addError('username', 'This username is already used.');
            }

            if ($this->auth->findByCredentials(['login' => $email])) {
                $this->validator->addError('email', 'This email is already used.');
            }

            if ($this->validator->isValid()) {
                $role = $this->auth->findRoleByName('User');

                $credentials = [
                    'username' => $username,
                    'email' => $email,
                    'password' => $password,
                    'first_name' => $first_name,
                    'last_name' => $last_name,
                    'city' => $city,
                    'country' => $country,
                    'birthdate' => $birthdate,
                    'permissions' => [
                        'user.delete' => 0
                    ]
                ];
                $user = $this->auth->registerAndActivate($credentials);

                $role->users()->attach($user);

                $this->flash('success', 'Your account has been created.');

                return $this->redirect($response, 'login');
            }
        }

        return $this->view->render($response, 'Auth/register.twig');
    }

    public function logout(Request $request, Response $response)
    {
        $this->auth->logout();

        return $this->redirect($response, 'home');
    }
}
