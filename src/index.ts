import fastify from 'fastify'
import { userRoutes } from './routes/user'
import { schoolRoutes } from './routes/school'
import { loginRoute } from './routes/login'
import cors from '@fastify/cors'

export const server = fastify()
server.register(cors, {
  origin: true,
})
server.register(userRoutes, { prefix: 'usuario' })
server.register(schoolRoutes, { prefix: 'escola' })
server.register(loginRoute)

server.listen({ port: 3333 }, () => {
  console.log(`Server running on port 3333`)
})
