FROM node:18

WORKDIR /app

# ---------------- SELECT FAILURE CASE ----------------
# Uncomment ONLY ONE of the below CMD lines

# 1. ✅ HEALTHY (baseline)
# CMD ["sh", "-c", "echo 'app running fine'; sleep 3600"]

# 2. 🔥 CONNECTION REFUSED
# CMD ["sh", "-c", "node -e \"console.error('connection refused')\"; sleep 3600"]

# 3. 🔥 MODULE NOT FOUND
# CMD ["sh", "-c", "node -e \"require('nonexistent-module')\" 2>&1 || true; sleep 3600"]

# 4. 🔥 PERMISSION DENIED
# CMD ["sh", "-c", "cat /root/secret 2>&1 || true; sleep 3600"]

# 5. 🔥 PORT CONFLICT
# CMD ["sh", "-c", "node -e \"require('http').createServer().listen(3000); require('http').createServer().listen(3000)\" 2>&1 || true; sleep 3600"]

# 6. 🔥 GENERIC CRASH MESSAGE (log-based)
CMD ["sh", "-c", "echo 'application crash' >&2; sleep 3600"]
