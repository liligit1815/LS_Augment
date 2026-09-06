.class Lcom/android/launcher3/anim/a0$a;
.super Landroid/os/Handler;
.source "RemoteAnimInterrupter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/anim/a0;-><init>(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/android/launcher3/anim/a0;


# direct methods
.method constructor <init>(Lcom/android/launcher3/anim/a0;Landroid/os/Looper;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/anim/a0$a;->a:Lcom/android/launcher3/anim/a0;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 1

    .line 1
    const-string v0, "msg"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget p1, p1, Landroid/os/Message;->what:I

    .line 7
    .line 8
    const/16 v0, 0x2711

    .line 9
    .line 10
    if-ne p1, v0, :cond_1

    .line 11
    .line 12
    const-string p1, "RemoteAnimInterrupter"

    .line 13
    .line 14
    const-string v0, "reset view state run"

    .line 15
    .line 16
    invoke-static {p1, v0}, LM3/a;->n(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    iget-object p1, p0, Lcom/android/launcher3/anim/a0$a;->a:Lcom/android/launcher3/anim/a0;

    .line 20
    .line 21
    invoke-static {p1}, Lcom/android/launcher3/anim/a0;->b(Lcom/android/launcher3/anim/a0;)Ljava/lang/Runnable;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    if-eqz p1, :cond_0

    .line 26
    .line 27
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 28
    .line 29
    .line 30
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/anim/a0$a;->a:Lcom/android/launcher3/anim/a0;

    .line 31
    .line 32
    const/4 p1, 0x0

    .line 33
    invoke-static {p0, p1}, Lcom/android/launcher3/anim/a0;->c(Lcom/android/launcher3/anim/a0;Ljava/lang/Runnable;)V

    .line 34
    .line 35
    .line 36
    :cond_1
    return-void
.end method
