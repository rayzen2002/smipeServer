import { FastifyInstance } from 'fastify'
import { prisma } from '../prisma/prisma'
import { z } from 'zod'

export async function schoolRoutes(server: FastifyInstance) {
  server.get('', async (req, res) => {
    const escolas = await prisma.school.findMany()
    res.status(200).send(escolas)
  })
  server.post('', async (req, res) => {
    const schoolSchema = z.object({
      name: z.string(),
      cnpj: z.string(),
      address: z.string(),
      code: z.number(),
    })
    const { name, cnpj, address, code } = schoolSchema.parse(req.body)
    await prisma.school.create({
      data: {
        name,
        cnpj,
        address,
        code,
      },
    })
    return res.status(201).send(`Escola ${name} registrada com sucesso!`)
  })
}
