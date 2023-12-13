import { FastifyInstance } from 'fastify'
import { prisma } from '../prisma/prisma'
import { z } from 'zod'

export async function userRoutes(server: FastifyInstance) {
  server.get('/', async (req, res) => {
    const users = await prisma.user.findMany()
    return res.status(200).send(users)
  })
  server.post('/', async (req, res) => {
    const userBodySchema = z.object({
      code: z.number(),
      cpf: z.string(),
      password: z.string(),
    })
    const { code, cpf, password } = userBodySchema.parse(req.body)
    await prisma.user.create({
      data: {
        cpf,
        password,
        schools: {
          create: {
            school: {
              connect: {
                code,
              },
            },
          },
        },
      },
    })
    return res.status(200).send('Usuario Criado com sucesso')
  })
}
