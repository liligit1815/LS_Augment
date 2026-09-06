.class Lcom/android/launcher3/cloudfolder/c$a$c;
.super Ldynamic/remoteview/b$a;
.source "NubiaRemoteView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/cloudfolder/c$a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/cloudfolder/c$a;


# direct methods
.method constructor <init>(Lcom/android/launcher3/cloudfolder/c$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/cloudfolder/c$a$c;->g:Lcom/android/launcher3/cloudfolder/c$a;

    .line 2
    .line 3
    invoke-direct {p0}, Ldynamic/remoteview/b$a;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public f()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/cloudfolder/c$a$c;->g:Lcom/android/launcher3/cloudfolder/c$a;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/launcher3/cloudfolder/c$a;->f(Lcom/android/launcher3/cloudfolder/c$a;)Landroid/os/Handler;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/launcher3/cloudfolder/c$a$c;->g:Lcom/android/launcher3/cloudfolder/c$a;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/android/launcher3/cloudfolder/c$a;->f(Lcom/android/launcher3/cloudfolder/c$a;)Landroid/os/Handler;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    new-instance v1, Lcom/android/launcher3/cloudfolder/c$a$c$b;

    .line 16
    .line 17
    invoke-direct {v1, p0}, Lcom/android/launcher3/cloudfolder/c$a$c$b;-><init>(Lcom/android/launcher3/cloudfolder/c$a$c;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public g(ILandroid/os/Bundle;Z)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/cloudfolder/c$a$c;->g:Lcom/android/launcher3/cloudfolder/c$a;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/launcher3/cloudfolder/c$a;->f(Lcom/android/launcher3/cloudfolder/c$a;)Landroid/os/Handler;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/launcher3/cloudfolder/c$a$c;->g:Lcom/android/launcher3/cloudfolder/c$a;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/android/launcher3/cloudfolder/c$a;->q:Lcom/android/launcher3/cloudfolder/c;

    .line 12
    .line 13
    invoke-virtual {v0, p2}, Lcom/android/launcher3/cloudfolder/RemoteView;->J(Landroid/os/Bundle;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/android/launcher3/cloudfolder/c$a$c;->g:Lcom/android/launcher3/cloudfolder/c$a;

    .line 17
    .line 18
    invoke-static {v0}, Lcom/android/launcher3/cloudfolder/c$a;->f(Lcom/android/launcher3/cloudfolder/c$a;)Landroid/os/Handler;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    new-instance v1, Lcom/android/launcher3/cloudfolder/c$a$c$a;

    .line 23
    .line 24
    invoke-direct {v1, p0, p1, p2, p3}, Lcom/android/launcher3/cloudfolder/c$a$c$a;-><init>(Lcom/android/launcher3/cloudfolder/c$a$c;ILandroid/os/Bundle;Z)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void
.end method
