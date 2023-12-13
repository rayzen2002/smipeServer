import fastify from 'fastify'
import { userRoutes } from './routes/user'
import { schoolRoutes } from './routes/school'

export const server = fastify()
server.register(userRoutes, { prefix: 'usuario' })
server.register(schoolRoutes, { prefix: 'escola' })

server.listen({ port: 3333 }, () => {
  console.log(`Server running on port 3333`)
})
