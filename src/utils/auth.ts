import { PrismaAdapter } from "@next-auth/prisma-adapter";
import { NextAuthOptions, User, getServerSession } from "next-auth";
import GoogleProvider from "next-auth/providers/google";
import CredentialsProvider from "next-auth/providers/credentials";
import { prisma } from "./connect";

declare module "next-auth" {
  interface Session {
    user: User & {
      isAdmin: Boolean;
    };
  }
}
declare module "next-auth/jwt" {
  interface JWT {
    isAdmin: Boolean;
    jti: string;
  }
}

export const authOptions: NextAuthOptions = {
  adapter: PrismaAdapter(prisma),
  session:{
    strategy:"jwt"
  },
  providers: [
    // CredentialsProvider({
    //   id: "credentials",
    //   name: "Credentials",
    //   async authorize(credentials) {
    //     //Check if the user exists.
    //     await connect();

    //     try {
    //       const user = await User.findOne({
    //         email: credentials.email,
    //       });

    //       if (user) {
    //         const isPasswordCorrect = await bcrypt.compare(
    //           credentials.password,
    //           user.password
    //         );

    //         if (isPasswordCorrect) {
    //           return user;
    //         } else {
    //           throw new Error("Wrong Credentials!");
    //         }
    //       } else {
    //         throw new Error("User not found!");
    //       }
    //     } catch (err) {
    //       throw new Error(err);
    //     }
    //   },
    // }),
    GoogleProvider({
      clientId: process.env.GOOGLE_ID!,
      clientSecret: process.env.GOOGLE_SECRET!,
    }),
  ],
  callbacks:{
    async session({token,session}){
      if(token){
        session.user.isAdmin = token.isAdmin
      }
      console.log({session}); 
      console.log("session---------------");
      console.log({token });
      // await prisma.session.create({
      //   data:JSON.stringify({          
          
      //     sessionToken:token.jti,
      //     userId:token.sub,
      //     expires: session.expires
      //   })
      // })
      return session
    },
    async jwt({token}){
      const userInDb = await prisma.user.findUnique({
        where:{
          email:token.email!
        }
      })
      
      token.isAdmin = userInDb?.isAdmin!
      return token;
    }
  }
};

export const getAuthSession = () => getServerSession(authOptions);