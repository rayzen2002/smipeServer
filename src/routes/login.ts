import { FastifyInstance } from 'fastify'
import { prisma } from '../prisma/prisma'
import { z } from 'zod'

export async function loginRoute(server: FastifyInstance) {
  server.post('/login', async (req, res) => {
    console.log(JSON.parse(req.body))
    const userBodySchema = z.object({
      code: z.number(),
      cpf: z.string(),
      password: z.string(),
    })
    const { code, cpf, password } = userBodySchema.parse(JSON.parse(req.body))
    console.log(code)
    try {
      const user = await prisma.user.findFirst({
        where: {
          cpf,
          password,
        },
      })
      const school = await prisma.school.findFirst({
        where: {
          code,
        },
      })
      const verif = await prisma.userOfSchools.findFirst({
        where: {
          code,
          cpf,
        },
      })
      console.log(verif)
      if (verif) {
        return res.status(200).send(user)
      } else {
        throw new Error()
      }
    } catch (error) {
      console.log(error)
      return res.status(410).send('Unauthorized')
    }
  })
}
