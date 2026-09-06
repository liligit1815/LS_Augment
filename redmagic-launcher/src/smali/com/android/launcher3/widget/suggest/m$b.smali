.class Lcom/android/launcher3/widget/suggest/m$b;
.super Ljava/lang/Object;
.source "SuggestWidgetHostView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/widget/suggest/m;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/widget/suggest/m;


# direct methods
.method constructor <init>(Lcom/android/launcher3/widget/suggest/m;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/widget/suggest/m$b;->g:Lcom/android/launcher3/widget/suggest/m;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/android/launcher3/widget/suggest/m$b;->g:Lcom/android/launcher3/widget/suggest/m;

    .line 7
    .line 8
    invoke-virtual {v1}, Lcom/android/launcher3/widget/suggest/m;->getSuggestWidgetHostViewTag()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string v1, "mWaitingUpdateTimeoutRunnable mWaitingUpdateAppIcons="

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    iget-object v1, p0, Lcom/android/launcher3/widget/suggest/m$b;->g:Lcom/android/launcher3/widget/suggest/m;

    .line 21
    .line 22
    invoke-static {v1}, Lcom/android/launcher3/widget/suggest/m;->e0(Lcom/android/launcher3/widget/suggest/m;)Z

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    const-string v1, "SuggestWidgetHostView"

    .line 34
    .line 35
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Lcom/android/launcher3/widget/suggest/m$b;->g:Lcom/android/launcher3/widget/suggest/m;

    .line 39
    .line 40
    invoke-static {v0}, Lcom/android/launcher3/widget/suggest/m;->e0(Lcom/android/launcher3/widget/suggest/m;)Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-eqz v0, :cond_0

    .line 45
    .line 46
    iget-object p0, p0, Lcom/android/launcher3/widget/suggest/m$b;->g:Lcom/android/launcher3/widget/suggest/m;

    .line 47
    .line 48
    invoke-virtual {p0}, Lcom/android/launcher3/widget/suggest/m;->M0()V

    .line 49
    .line 50
    .line 51
    :cond_0
    return-void
.end method
