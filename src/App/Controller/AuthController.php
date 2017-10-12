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
                    return $this->redirect($response, 'home');
                } else {
                    $this->validator->addError('auth', 'Bad username or password');
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
                /* 'username' => V::length(3, 25)->alnum('_')->noWhitespace(),
                'email' => V::noWhitespace()->email(),
                'password' => [
                    'rules' => V::noWhitespace()->length(6, 25),
                    'messages' => [
                        'length' => 'The password length must be between {{minValue}} and {{maxValue}} characters'
                    ]
                ],
                'password_confirm' => [
                    'rules' => V::equals($password),
                    'messages' => [
                        'equals' => 'Passwords don\'t match'
                    ]
                ],
                'first_name' => V::length(1, 25)->alpha()->noWhitespace(),
                'last_name' => V::length(1, 25)->alpha(),
                'city' => V::length(1, 25)->alpha()->noWhitespace(),
                'country' => V::length(1, 25)->alpha()->noWhitespace(),
<<<<<<< HEAD
                'birthdate' => V::Date('Y-m-d')
=======
                'birthdate' => V::Date('Y-m-d') */
>>>>>>> Added user registration.
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
