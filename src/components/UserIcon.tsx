"use client"

import { useSession } from "next-auth/react";
import Image from "next/image";


export const UserIcon = () => {
    const { data } = useSession();

    return <div className="flex justify-end min-w-30">

          {data?.user.image
            ? <Image className="rounded  flex-none w-[30px] h-[30px]" src={data?.user.image} alt="/noob.png" width={30} height={30} />
            : <Image className="rounded" src="/noob.png" alt="/noob.png" width={30} height={30} />}
        </div>

}