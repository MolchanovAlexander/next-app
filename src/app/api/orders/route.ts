
import { getAuthSession } from "@/utils/auth";
import { prisma } from "@/utils/connect";
import { NextRequest, NextResponse } from "next/server";


// FETCH ALL Orders
export const GET = async (req: NextRequest) => {
  const session  = await getAuthSession()
  if (session) {
    try {
      if(session.user.isAdmin){
        const orders = await prisma.order.findMany()
        return new NextResponse(JSON.stringify(orders), { status: 200 });
      }
      const orders = await prisma.order.findMany({
        where:{
          userEmail:session.user.email!
        }
      })
      return new NextResponse(JSON.stringify(orders), { status: 200 });
    } catch (err) {
      console.log(err);
      return new NextResponse(
        JSON.stringify({ message: "You are not auth!" }),
        { status: 401 }
      );
    }
  }

};
export const POST = async (req: NextRequest) => {
  try {
    const body = await req.json();
    const product = await prisma.product.create({
      data: body,
    });
    return new NextResponse(JSON.stringify(product), { status: 201 });
  } catch (err) {
    console.log(err);
    return new NextResponse(
      JSON.stringify({ message: "Something went wrong!" }),
      { status: 500 }
    );
  }
};

// // fetch
// export const GET =()=> {
//     return new NextResponse(":noob", {status:200}) 
// }
// export const POST =()=> {
//     return new NextResponse(":noob", {status:200}) 
// }