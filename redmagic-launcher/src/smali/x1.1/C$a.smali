.class Lx1/C$a;
.super Landroid/os/Handler;
.source "GridLoadingToast.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lx1/C;-><init>(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lx1/C;


# direct methods
.method constructor <init>(Lx1/C;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lx1/C$a;->a:Lx1/C;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 2

    .line 1
    iget v0, p1, Landroid/os/Message;->what:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    iget-object v0, p0, Lx1/C$a;->a:Lx1/C;

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    invoke-virtual {v0, v1}, Lx1/C;->e(Z)V

    .line 10
    .line 11
    .line 12
    :cond_0
    iget v0, p1, Landroid/os/Message;->what:I

    .line 13
    .line 14
    const/4 v1, 0x2

    .line 15
    if-ne v0, v1, :cond_1

    .line 16
    .line 17
    iget-object v0, p0, Lx1/C$a;->a:Lx1/C;

    .line 18
    .line 19
    invoke-static {v0}, Lx1/C;->d(Lx1/C;)V

    .line 20
    .line 21
    .line 22
    :cond_1
    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method
