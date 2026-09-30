<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    String username =
            (String) session.getAttribute("username");

    if (username == null) {

        response.sendRedirect("login.jsp");

        return;
    }
%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>ChatSpace</title>

    <style>

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {

            min-height: 100vh;

            font-family:
                Inter,
                Arial,
                Helvetica,
                sans-serif;

            background: #f1f5f9;

            color: #0f172a;
        }

        .app {

            width: 100%;

            min-height: 100vh;

            display: flex;
            flex-direction: column;
        }

        .topbar {

            height: 72px;

            display: flex;
            align-items: center;
            justify-content: space-between;

            padding: 0 28px;

            background: white;

            border-bottom:
                1px solid #e2e8f0;

            box-shadow:
                0 2px 10px rgba(15, 23, 42, 0.04);
        }

        .brand {

            display: flex;
            align-items: center;

            gap: 12px;
        }

        .brand-icon {

            width: 42px;
            height: 42px;

            display: flex;
            align-items: center;
            justify-content: center;

            border-radius: 13px;

            background:
                linear-gradient(
                    135deg,
                    #6366f1,
                    #7c3aed
                );

            color: white;

            font-size: 20px;
        }

        .brand-text h1 {

            font-size: 18px;
        }

        .brand-text p {

            font-size: 12px;
            color: #64748b;
        }

        .user-area {

            display: flex;
            align-items: center;

            gap: 10px;
        }

        .avatar {

            width: 38px;
            height: 38px;

            border-radius: 50%;

            display: flex;
            align-items: center;
            justify-content: center;

            background: #ede9fe;

            color: #6d28d9;

            font-weight: 700;
        }

        .user-name {

            font-size: 14px;
            font-weight: 600;
        }

        .status {

            font-size: 11px;
            color: #16a34a;

            margin-top: 2px;
        }

        .main {

            flex: 1;

            display: flex;
            justify-content: center;

            padding: 28px;
        }

        .chat-card {

            width: 100%;
            max-width: 1000px;

            height: calc(100vh - 128px);

            min-height: 540px;

            background: white;

            border-radius: 22px;

            overflow: hidden;

            display: flex;
            flex-direction: column;

            box-shadow:
                0 15px 50px rgba(15, 23, 42, 0.08);

            border:
                1px solid #e2e8f0;
        }

        .chat-header {

            padding: 20px 24px;

            border-bottom:
                1px solid #e2e8f0;

            background: #ffffff;
        }

        .receiver-label {

            font-size: 12px;

            color: #64748b;

            margin-bottom: 8px;
        }

        .receiver-row {

            display: flex;
            gap: 12px;
        }

        .receiver-input {

            flex: 1;

            padding: 13px 15px;

            border:
                1px solid #cbd5e1;

            border-radius: 12px;

            outline: none;

            font-size: 14px;

            background: #f8fafc;
        }

        .receiver-input:focus {

            background: white;

            border-color: #6366f1;

            box-shadow:
                0 0 0 4px rgba(99, 102, 241, 0.10);
        }

        .conversation-title {

            margin-top: 14px;

            color: #334155;

            font-size: 15px;
            font-weight: 700;
        }

        .chat-box {

            flex: 1;

            overflow-y: auto;

            padding: 24px;

            background:
                linear-gradient(
                    180deg,
                    #f8fafc 0%,
                    #f1f5f9 100%
                );
        }

        .empty {

            height: 100%;

            display: flex;
            flex-direction: column;

            align-items: center;
            justify-content: center;

            color: #94a3b8;

            text-align: center;
        }

        .empty-icon {

            width: 70px;
            height: 70px;

            display: flex;
            align-items: center;
            justify-content: center;

            border-radius: 50%;

            background: #e0e7ff;

            font-size: 30px;

            margin-bottom: 14px;
        }

        .empty-title {

            color: #475569;

            font-weight: 700;

            margin-bottom: 5px;
        }

        .message-row {

            display: flex;

            margin-bottom: 14px;
        }

        .message-row.mine {

            justify-content: flex-end;
        }

        .message-bubble {

            max-width: 72%;

            padding: 12px 15px;

            border-radius: 16px;

            background: white;

            border:
                1px solid #e2e8f0;

            box-shadow:
                0 2px 8px rgba(15, 23, 42, 0.04);
        }

        .message-row.mine
        .message-bubble {

            background:
                linear-gradient(
                    135deg,
                    #6366f1,
                    #7c3aed
                );

            color: white;

            border: none;
        }

        .sender {

            font-size: 11px;

            font-weight: 700;

            color: #6366f1;

            margin-bottom: 5px;
        }

        .message-row.mine
        .sender {

            color: #ddd6fe;
        }

        .message-text {

            font-size: 14px;

            line-height: 1.5;

            white-space: pre-wrap;

            overflow-wrap: anywhere;
        }

        .message-time {

            font-size: 10px;

            color: #94a3b8;

            margin-top: 6px;

            text-align: right;
        }

        .message-row.mine
        .message-time {

            color: #ddd6fe;
        }

        .composer {

            padding: 18px 20px;

            border-top:
                1px solid #e2e8f0;

            background: white;
        }

        .composer-row {

            display: flex;

            align-items: center;

            gap: 10px;

            background: #f8fafc;

            border:
                1px solid #e2e8f0;

            border-radius: 15px;

            padding: 7px;
        }

        .message-input {

            flex: 1;

            border: none;

            outline: none;

            padding: 12px;

            font-size: 14px;

            background: transparent;
        }

        .send-btn {

            width: 45px;
            height: 45px;

            border: none;

            border-radius: 12px;

            background:
                linear-gradient(
                    135deg,
                    #6366f1,
                    #7c3aed
                );

            color: white;

            font-size: 18px;

            cursor: pointer;

            transition:
                transform 0.15s,
                box-shadow 0.15s;
        }

        .send-btn:hover {

            transform: translateY(-1px);

            box-shadow:
                0 7px 18px rgba(99, 102, 241, 0.25);
        }

        .hint {

            font-size: 11px;

            color: #94a3b8;

            padding: 8px 4px 0;
        }

        .toast {

            position: fixed;

            right: 20px;
            bottom: 20px;

            max-width: 320px;

            padding: 13px 16px;

            border-radius: 12px;

            color: white;

            background: #ef4444;

            box-shadow:
                0 10px 30px rgba(0, 0, 0, 0.15);

            display: none;

            font-size: 13px;

            z-index: 1000;
        }

        @media (max-width: 700px) {

            .topbar {

                padding: 0 15px;
            }

            .main {

                padding: 12px;
            }

            .chat-card {

                height: calc(100vh - 96px);

                min-height: 0;

                border-radius: 17px;
            }

            .chat-header {

                padding: 16px;
            }

            .chat-box {

                padding: 16px;
            }

            .message-bubble {

                max-width: 85%;
            }

            .brand-text p,
            .status {

                display: none;
            }

            .user-name {

                display: none;
            }

        }

    </style>

</head>

<body>

<div class="app">

    <header class="topbar">

        <div class="brand">

            <div class="brand-icon">
                💬
            </div>

            <div class="brand-text">

                <h1>ChatSpace</h1>

                <p>Simple Chatting System</p>

            </div>

        </div>


        <div class="user-area">

            <div>

                <div class="user-name">
                    <%= username %>
                </div>

                <div class="status">
                    ● Online
                </div>

            </div>

            <div class="avatar">
                <%= username.substring(0, 1).toUpperCase() %>
            </div>

        </div>

    </header>


    <main class="main">

        <section class="chat-card">


            <div class="chat-header">

                <div class="receiver-label">
                    CHAT WITH
                </div>

                <div class="receiver-row">

                    <input
                        type="text"
                        id="receiver"
                        class="receiver-input"
                        placeholder="Enter username, e.g. bob"
                        autocomplete="off">

                </div>

                <div
                    id="conversationTitle"
                    class="conversation-title">

                    Select a user to start chatting

                </div>

            </div>


            <div
                id="chatBox"
                class="chat-box">

                <div class="empty">

                    <div class="empty-icon">
                        💬
                    </div>

                    <div class="empty-title">
                        Start a conversation
                    </div>

                    <div>
                        Enter a username above.
                    </div>

                </div>

            </div>


            <div class="composer">

                <div class="composer-row">

                    <input
                        type="text"
                        id="message"
                        class="message-input"
                        placeholder="Type a message..."
                        autocomplete="off">

                    <button
                        class="send-btn"
                        onclick="sendMessage()"
                        title="Send">

                        ➤

                    </button>

                </div>

                <div class="hint">
                    Press Enter to send
                </div>

            </div>

        </section>

    </main>

</div>


<div
    id="toast"
    class="toast">
</div>


<script>

    const currentUser =
        document.getElementById("currentUser");


    let lastReceiver = "";


    function showToast(message) {

        const toast =
            document.getElementById("toast");

        toast.textContent = message;

        toast.style.display = "block";

        setTimeout(function() {

            toast.style.display = "none";

        }, 3000);
    }


    function getReceiver() {

        return document
            .getElementById("receiver")
            .value
            .trim();
    }


    function loadMessages() {

        const receiver = getReceiver();

        if (receiver === "") {
            return;
        }

        lastReceiver = receiver;

        document
            .getElementById("conversationTitle")
            .textContent =
                "Conversation with " + receiver;


        fetch(
            "chat?receiver=" +
            encodeURIComponent(receiver),
            {
                method: "GET",
                cache: "no-store"
            }
        )

        .then(function(response) {

            if (!response.ok) {

                throw new Error(
                    "HTTP " + response.status
                );
            }

            return response.json();
        })

        .then(function(messages) {

            const chatBox =
                document.getElementById("chatBox");

            chatBox.innerHTML = "";


            if (messages.length === 0) {

                chatBox.innerHTML = `
                    <div class="empty">
                        <div class="empty-icon">👋</div>
                        <div class="empty-title">
                            No messages yet
                        </div>
                        <div>
                            Send the first message.
                        </div>
                    </div>
                `;

                return;
            }


            messages.forEach(function(msg) {

                const row =
                    document.createElement("div");

                const mine =
                    msg.sender === currentUserValue();

                row.className =
                    "message-row" +
                    (mine ? " mine" : "");


                const bubble =
                    document.createElement("div");

                bubble.className =
                    "message-bubble";


                const sender =
                    document.createElement("div");

                sender.className = "sender";

                sender.textContent =
                    msg.sender;


                const text =
                    document.createElement("div");

                text.className = "message-text";

                text.textContent =
                    msg.message;


                const time =
                    document.createElement("div");

                time.className = "message-time";

                time.textContent =
                    msg.time;


                bubble.appendChild(sender);

                bubble.appendChild(text);

                bubble.appendChild(time);

                row.appendChild(bubble);

                chatBox.appendChild(row);
            });


            chatBox.scrollTop =
                chatBox.scrollHeight;
        })

        .catch(function(error) {

            console.error(error);
        });
    }


    function currentUserValue() {

        return "<%= username %>";
    }


    function sendMessage() {

        const receiver = getReceiver();

        const input =
            document.getElementById("message");

        const message =
            input.value.trim();


        if (receiver === "") {

            showToast(
                "Enter the receiver username."
            );

            return;
        }


        if (message === "") {

            showToast(
                "Type a message first."
            );

            return;
        }


        const data =
            new URLSearchParams();

        data.append(
            "receiver",
            receiver
        );

        data.append(
            "message",
            message
        );


        fetch("chat", {

            method: "POST",

            headers: {
                "Content-Type":
                    "application/x-www-form-urlencoded"
            },

            body:
                data.toString()

        })

        .then(function(response) {

            return response.text();

        })

        .then(function(result) {

            if (result === "success") {

                input.value = "";

                loadMessages();

                input.focus();

            } else {

                showToast(result);
            }
        })

        .catch(function(error) {

            console.error(error);

            showToast(
                "Unable to send message."
            );
        });
    }


    document
        .getElementById("receiver")
        .addEventListener(
            "input",
            function() {

                loadMessages();

            }
        );


    document
        .getElementById("receiver")
        .addEventListener(
            "keydown",
            function(event) {

                if (event.key === "Enter") {

                    event.preventDefault();

                    loadMessages();

                    document
                        .getElementById("message")
                        .focus();
                }
            }
        );


    document
        .getElementById("message")
        .addEventListener(
            "keydown",
            function(event) {

                if (event.key === "Enter") {

                    event.preventDefault();

                    sendMessage();
                }
            }
        );


    // Automatically retrieve new messages every 2 seconds.
    setInterval(
        loadMessages,
        2000
    );

</script>

</body>

</html>