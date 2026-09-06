.class Lcom/android/launcher3/cloudfolder/b$a$c;
.super Lc5/a$a;
.source "MyOSRemoteView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/cloudfolder/b$a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/cloudfolder/b$a;


# direct methods
.method constructor <init>(Lcom/android/launcher3/cloudfolder/b$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/cloudfolder/b$a$c;->g:Lcom/android/launcher3/cloudfolder/b$a;

    .line 2
    .line 3
    invoke-direct {p0}, Lc5/a$a;-><init>()V

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
    iget-object v0, p0, Lcom/android/launcher3/cloudfolder/b$a$c;->g:Lcom/android/launcher3/cloudfolder/b$a;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/launcher3/cloudfolder/b$a;->f(Lcom/android/launcher3/cloudfolder/b$a;)Landroid/os/Handler;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/launcher3/cloudfolder/b$a$c;->g:Lcom/android/launcher3/cloudfolder/b$a;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/android/launcher3/cloudfolder/b$a;->f(Lcom/android/launcher3/cloudfolder/b$a;)Landroid/os/Handler;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    new-instance v1, Lcom/android/launcher3/cloudfolder/b$a$c$b;

    .line 16
    .line 17
    invoke-direct {v1, p0}, Lcom/android/launcher3/cloudfolder/b$a$c$b;-><init>(Lcom/android/launcher3/cloudfolder/b$a$c;)V

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
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/cloudfolder/b$a$c;->g:Lcom/android/launcher3/cloudfolder/b$a;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/launcher3/cloudfolder/b$a;->f(Lcom/android/launcher3/cloudfolder/b$a;)Landroid/os/Handler;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/launcher3/cloudfolder/b$a$c;->g:Lcom/android/launcher3/cloudfolder/b$a;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/android/launcher3/cloudfolder/b$a;->q:Lcom/android/launcher3/cloudfolder/b;

    .line 12
    .line 13
    invoke-virtual {v0, p2}, Lcom/android/launcher3/cloudfolder/RemoteView;->J(Landroid/os/Bundle;)V

    .line 14
    .line 15
    .line 16
    new-instance v0, Ljava/lang/StringBuilder;

    .line 17
    .line 18
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 19
    .line 20
    .line 21
    const-string v1, "mIPCClient updateView:"

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    new-instance v1, Ljava/lang/Throwable;

    .line 27
    .line 28
    const-string v2, "updateView"

    .line 29
    .line 30
    invoke-direct {v1, v2}, Ljava/lang/Throwable;-><init>(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    invoke-static {v1}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    const-string v1, "RemoteView.RC"

    .line 45
    .line 46
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, Lcom/android/launcher3/cloudfolder/b$a$c;->g:Lcom/android/launcher3/cloudfolder/b$a;

    .line 50
    .line 51
    invoke-static {v0}, Lcom/android/launcher3/cloudfolder/b$a;->f(Lcom/android/launcher3/cloudfolder/b$a;)Landroid/os/Handler;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    new-instance v1, Lcom/android/launcher3/cloudfolder/b$a$c$a;

    .line 56
    .line 57
    invoke-direct {v1, p0, p1, p2, p3}, Lcom/android/launcher3/cloudfolder/b$a$c$a;-><init>(Lcom/android/launcher3/cloudfolder/b$a$c;ILandroid/os/Bundle;Z)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 61
    .line 62
    .line 63
    :cond_0
    return-void
.end method
