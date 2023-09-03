import Image from "next/image";
import Link from "next/link";

export default function Footer() {
    return (
      <Link href="/cart">
        <div>
            <Image src="/cart.png" alt="" />
        </div>
      </Link>
     )
  }