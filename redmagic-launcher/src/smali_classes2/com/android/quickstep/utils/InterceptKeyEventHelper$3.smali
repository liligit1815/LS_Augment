.class Lcom/android/quickstep/utils/InterceptKeyEventHelper$3;
.super Ljava/lang/Object;
.source "InterceptKeyEventHelper.java"

# interfaces
.implements Lu4/a;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/utils/InterceptKeyEventHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lu4/a<",
        "Ljava/lang/reflect/Method;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/quickstep/utils/InterceptKeyEventHelper;


# direct methods
.method constructor <init>(Lcom/android/quickstep/utils/InterceptKeyEventHelper;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/utils/InterceptKeyEventHelper$3;->this$0:Lcom/android/quickstep/utils/InterceptKeyEventHelper;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public bridge synthetic invoke()Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/utils/InterceptKeyEventHelper$3;->invoke()Ljava/lang/reflect/Method;

    move-result-object p0

    return-object p0
.end method

.method public final invoke()Ljava/lang/reflect/Method;
    .locals 3

    .line 2
    :try_start_0
    iget-object p0, p0, Lcom/android/quickstep/utils/InterceptKeyEventHelper$3;->this$0:Lcom/android/quickstep/utils/InterceptKeyEventHelper;

    invoke-virtual {p0}, Lcom/android/quickstep/utils/InterceptKeyEventHelper;->getMFVWindowManager()Ljava/lang/Object;

    move-result-object p0

    .line 3
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    const-string v0, "setInterceptKeyEventEnabled"

    sget-object v1, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    const-class v2, Lcom/android/wm/shell/recents/d;

    filled-new-array {v1, v2}, [Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    .line 4
    :catch_0
    const-string p0, "InterceptKeyEventHelper"

    const-string v0, "no such method: setInterceptKeyEventEnabled"

    invoke-static {p0, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    const/4 p0, 0x0

    return-object p0
.end method
