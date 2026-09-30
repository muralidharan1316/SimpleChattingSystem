<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>ChatSpace | Login</title>

    <style>

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {

            min-height: 100vh;

            display: flex;
            align-items: center;
            justify-content: center;

            padding: 20px;

            font-family:
                Inter,
                Arial,
                Helvetica,
                sans-serif;

            background:
                linear-gradient(
                    135deg,
                    #111827 0%,
                    #1e293b 45%,
                    #312e81 100%
                );

            color: #111827;
        }

        .page {

            width: 100%;
            max-width: 440px;
        }

        .logo-area {

            text-align: center;
            color: white;
            margin-bottom: 24px;
        }

        .logo {

            width: 64px;
            height: 64px;

            margin: 0 auto 16px;

            display: flex;
            align-items: center;
            justify-content: center;

            border-radius: 20px;

            background:
                linear-gradient(
                    135deg,
                    #6366f1,
                    #8b5cf6
                );

            font-size: 30px;

            box-shadow:
                0 15px 35px rgba(0, 0, 0, 0.25);
        }

        .logo-area h1 {

            font-size: 30px;
            margin-bottom: 8px;
        }

        .logo-area p {

            color: #cbd5e1;
            font-size: 14px;
        }

        .card {

            background: rgba(255, 255, 255, 0.98);

            border-radius: 24px;

            padding: 32px;

            box-shadow:
                0 25px 60px rgba(0, 0, 0, 0.25);
        }

        .card h2 {

            font-size: 22px;
            margin-bottom: 8px;
        }

        .subtitle {

            color: #64748b;
            font-size: 14px;
            margin-bottom: 24px;
        }

        .error {

            background: #fef2f2;
            color: #dc2626;

            border: 1px solid #fecaca;

            padding: 12px 14px;

            border-radius: 12px;

            margin-bottom: 18px;

            font-size: 14px;
        }

        .field {

            margin-bottom: 18px;
        }

        .field label {

            display: block;

            font-size: 13px;
            font-weight: 600;

            color: #334155;

            margin-bottom: 8px;
        }

        .field input {

            width: 100%;

            padding: 14px 15px;

            border: 1px solid #cbd5e1;

            border-radius: 12px;

            outline: none;

            font-size: 15px;

            background: #f8fafc;

            transition:
                border 0.2s,
                box-shadow 0.2s,
                background 0.2s;
        }

        .field input:focus {

            background: white;

            border-color: #6366f1;

            box-shadow:
                0 0 0 4px rgba(99, 102, 241, 0.12);
        }

        .login-btn {

            width: 100%;

            padding: 14px;

            border: none;

            border-radius: 12px;

            background:
                linear-gradient(
                    135deg,
                    #6366f1,
                    #7c3aed
                );

            color: white;

            font-size: 15px;

            font-weight: 700;

            cursor: pointer;

            transition:
                transform 0.2s,
                box-shadow 0.2s;
        }

        .login-btn:hover {

            transform: translateY(-1px);

            box-shadow:
                0 10px 25px rgba(99, 102, 241, 0.30);
        }

        .demo {

            margin-top: 20px;

            padding: 14px;

            border-radius: 12px;

            background: #f8fafc;

            color: #64748b;

            font-size: 12px;

            text-align: center;
        }

        .demo strong {

            color: #334155;
        }

        @media (max-width: 480px) {

            .card {
                padding: 24px;
            }

            .logo-area h1 {
                font-size: 26px;
            }
        }

    </style>

</head>

<body>

<div class="page">

    <div class="logo-area">

        <div class="logo">💬</div>

        <h1>ChatSpace</h1>

        <p>Simple, fast and private messaging</p>

    </div>


    <div class="card">

        <h2>Welcome back</h2>

        <p class="subtitle">
            Sign in to continue chatting with your contacts.
        </p>


        <%
            String error = request.getParameter("error");

            if (error != null) {
        %>

            <div class="error">
                <%= error %>
            </div>

        <%
            }
        %>


        <form action="login" method="post">

            <div class="field">

                <label for="username">
                    Username
                </label>

                <input
                    type="text"
                    id="username"
                    name="username"
                    placeholder="Enter your username"
                    autocomplete="username"
                    required>

            </div>


            <div class="field">

                <label for="password">
                    Password
                </label>

                <input
                    type="password"
                    id="password"
                    name="password"
                    placeholder="Enter your password"
                    autocomplete="current-password"
                    required>

            </div>


            <button
                type="submit"
                class="login-btn">

                Sign In

            </button>

        </form>


        <div class="demo">

            Demo accounts:
            <strong>alice / 1234</strong>
            &nbsp; and &nbsp;
            <strong>bob / 1234</strong>

        </div>

    </div>

</div>

</body>

</html>