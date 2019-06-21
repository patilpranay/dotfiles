# Kill `ssh-agent` so that password is required next time the SSH key is used.
kill $SSH_AGENT_PID
