.class Lcom/android/quickstep/util/InputInjectHelper$1;
.super Ljava/lang/Object;
.source "InputInjectHelper.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/util/InputInjectHelper;-><init>(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/quickstep/util/InputInjectHelper;


# direct methods
.method constructor <init>(Lcom/android/quickstep/util/InputInjectHelper;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/util/InputInjectHelper$1;->this$0:Lcom/android/quickstep/util/InputInjectHelper;

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
    const-string v0, "InputInjectHelper"

    .line 2
    .line 3
    const-string v1, "swipe time out!"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/android/quickstep/util/InputInjectHelper$1;->this$0:Lcom/android/quickstep/util/InputInjectHelper;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/android/quickstep/util/InputInjectHelper;->injectDownAndUpEvent()V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/android/quickstep/util/InputInjectHelper$1;->this$0:Lcom/android/quickstep/util/InputInjectHelper;

    .line 14
    .line 15
    invoke-static {v0}, Lcom/android/quickstep/util/InputInjectHelper;->a(Lcom/android/quickstep/util/InputInjectHelper;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object v0, p0, Lcom/android/quickstep/util/InputInjectHelper$1;->this$0:Lcom/android/quickstep/util/InputInjectHelper;

    .line 22
    .line 23
    invoke-virtual {v0}, Lcom/android/quickstep/util/InputInjectHelper;->resetDown()V

    .line 24
    .line 25
    .line 26
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/util/InputInjectHelper$1;->this$0:Lcom/android/quickstep/util/InputInjectHelper;

    .line 27
    .line 28
    invoke-static {v0}, Lcom/android/quickstep/util/InputInjectHelper;->b(Lcom/android/quickstep/util/InputInjectHelper;)Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-eqz v0, :cond_1

    .line 33
    .line 34
    iget-object v0, p0, Lcom/android/quickstep/util/InputInjectHelper$1;->this$0:Lcom/android/quickstep/util/InputInjectHelper;

    .line 35
    .line 36
    invoke-virtual {v0}, Lcom/android/quickstep/util/InputInjectHelper;->resetUp()V

    .line 37
    .line 38
    .line 39
    iget-object p0, p0, Lcom/android/quickstep/util/InputInjectHelper$1;->this$0:Lcom/android/quickstep/util/InputInjectHelper;

    .line 40
    .line 41
    invoke-virtual {p0}, Lcom/android/quickstep/util/InputInjectHelper;->resetAll()V

    .line 42
    .line 43
    .line 44
    :cond_1
    return-void
.end method
