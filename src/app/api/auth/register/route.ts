
import { prisma } from "@/utils/connect";
import bcrypt from "bcryptjs";
import { NextRequest, NextResponse } from "next/server";

interface Body {
    name: string;
    email: string;
    password: string;
}
export const POST = async (req: NextRequest) => {
    const {name, email, password} = await req.json();
    console.log(name, email, password);

    const hashedPassword = await bcrypt.hash(password, 5);

    try {
        const product = await prisma.user.create({
            data: { name: name, email: email, password: hashedPassword }
        });
        return new NextResponse("User has been created", {
            status: 201,
        });
    } catch (err: any) {
        return new NextResponse(err.message, {
            status: 500,
        });
    }
};