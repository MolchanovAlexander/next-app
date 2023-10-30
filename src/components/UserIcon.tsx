"use client"

import { useSession } from "next-auth/react";
import Image from "next/image";
import { useTelegram } from "./TelegramProvider";

export const UserIcon = () => {
  const { data } = useSession();
  const { user, webApp } = useTelegram();
  console.log(user);
  
  return (
    <div className="flex justify-end min-w-30 basis-auto ">
      {data?.user.image ? (
        <div className="rounded overflow-hidden basis-auto">
          <Image
            src={data?.user.image}
            alt="/noob.png"
            width={30}
            height={30}
            className="w-30 h-30  !important"
          />{user?.username}
        </div>
      ) : (
        <div className="rounded overflow-hidden">
          <Image
            src="/noob.png"
            alt="/noob.png"
            width={30}
            height={30}
            className="w-30 h-30"
          />
        </div>
      )}
    </div>
  );
};
