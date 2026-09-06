.class public final Lcom/android/launcher3/Y4$b;
.super Landroid/database/ContentObserver;
.source "PillColorPorovider.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/Y4;-><init>(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/android/launcher3/Y4;


# direct methods
.method constructor <init>(Lcom/android/launcher3/Y4;Landroid/os/Handler;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/Y4$b;->a:Lcom/android/launcher3/Y4;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Landroid/database/ContentObserver;-><init>(Landroid/os/Handler;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onChange(ZLandroid/net/Uri;)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/Y4$b;->a:Lcom/android/launcher3/Y4;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/android/launcher3/Y4;->d(Lcom/android/launcher3/Y4;)Landroid/net/Uri;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-static {p2, p1}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_1

    .line 12
    .line 13
    iget-object p1, p0, Lcom/android/launcher3/Y4$b;->a:Lcom/android/launcher3/Y4;

    .line 14
    .line 15
    invoke-static {p1}, Lcom/android/launcher3/Y4;->b(Lcom/android/launcher3/Y4;)Landroid/content/Context;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    invoke-virtual {p2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 20
    .line 21
    .line 22
    move-result-object p2

    .line 23
    const-string v0, "matcha_enable"

    .line 24
    .line 25
    const/4 v1, 0x0

    .line 26
    invoke-static {p2, v0, v1}, Landroid/provider/Settings$Secure;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    .line 27
    .line 28
    .line 29
    move-result p2

    .line 30
    invoke-static {p1, p2}, Lcom/android/launcher3/Y4;->g(Lcom/android/launcher3/Y4;I)V

    .line 31
    .line 32
    .line 33
    iget-object p0, p0, Lcom/android/launcher3/Y4$b;->a:Lcom/android/launcher3/Y4;

    .line 34
    .line 35
    invoke-static {p0}, Lcom/android/launcher3/Y4;->e(Lcom/android/launcher3/Y4;)I

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    if-eqz p1, :cond_0

    .line 40
    .line 41
    const/4 v1, 0x1

    .line 42
    :cond_0
    invoke-virtual {p0, v1}, Lcom/android/launcher3/Y4;->o(Z)V

    .line 43
    .line 44
    .line 45
    :cond_1
    return-void
.end method
