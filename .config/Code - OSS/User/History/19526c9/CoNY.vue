<script setup>
import Card from '@/components/card.vue';
import Image from '@/components/image.vue';
import Page from '@/components/page.vue';
</script>

<template>
    <Page title="Chiro Stam" subtitle="Als je't mij vraagt?! Chiro!" image="groepsfoto.webp">
        <Card title="Trooper" subtitle=" Via Trooper kan je ons steunen bij elke online aankoop die je doet.">
            <Image src="trooper.webp" />
            <p>
                Bij meer dan 600 partnershops van Trooper, gaat een percentage van jouw aankoopbedrag naar onze
                chirokas, zonder dat het jou iets extra kost.
            </p>
            <p>
                Hoe werkt het? Je surft naar
                <Link href="https://www.trooper.be/nl/trooperverenigingen/chirostam">deze link</Link>. Daar klik je op
                het logo van je favoriete online shop (onder andere: Bol.com, Take-away.com, Hema, Brussels Airlines,
                Torfs, ..).
            </p>
        </Card>
    </Page>
</template>