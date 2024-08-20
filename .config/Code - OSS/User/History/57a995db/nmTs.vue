<script setup lang="ts">
import { RouterLink } from 'vue-router';
import Link from './link.vue';
</script>

<template>
    <footer class="flex flex-col md:flex-row items-center justify-between mt-5 mb-3 text-slate-600 px-1">
        <h2 class="font-bold">
            <RouterLink to="/">Chiro Stam</RouterLink> 2024
        </h2>
        <h2 class="font-semibold flex gap-2">
            <Link href="mailto:chirostammortsel@gmail.com">Mail</Link>
            <Link href="https://instagram.com/chirostam">Instagram</Link>
            <Link href="https://facebook.com/chirostam">Facebook</Link>
            <Link href="/privacy-verklaring">Privacy</Link>
        </h2>
    </footer>
</template>