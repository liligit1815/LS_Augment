.class final Lcom/android/quickstep/OverviewCommandHelper$executeCommandSuspended$2$1;
.super Ljava/lang/Object;
.source "OverviewCommandHelper.kt"

# interfaces
.implements Lu4/l;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/OverviewCommandHelper;->executeCommandSuspended(Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;Ll4/d;)Ljava/lang/Object;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lu4/l<",
        "Ljava/lang/Throwable;",
        "Lh4/t;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic $command:Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;

.field final synthetic $isResumed:Lkotlin/jvm/internal/z;

.field final synthetic this$0:Lcom/android/quickstep/OverviewCommandHelper;


# direct methods
.method constructor <init>(Lcom/android/quickstep/OverviewCommandHelper;Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;Lkotlin/jvm/internal/z;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/OverviewCommandHelper$executeCommandSuspended$2$1;->this$0:Lcom/android/quickstep/OverviewCommandHelper;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/quickstep/OverviewCommandHelper$executeCommandSuspended$2$1;->$command:Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/android/quickstep/OverviewCommandHelper$executeCommandSuspended$2$1;->$isResumed:Lkotlin/jvm/internal/z;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public bridge synthetic invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Ljava/lang/Throwable;

    invoke-virtual {p0, p1}, Lcom/android/quickstep/OverviewCommandHelper$executeCommandSuspended$2$1;->invoke(Ljava/lang/Throwable;)V

    sget-object p0, Lh4/t;->a:Lh4/t;

    return-object p0
.end method

.method public final invoke(Ljava/lang/Throwable;)V
    .locals 2

    .line 2
    iget-object v0, p0, Lcom/android/quickstep/OverviewCommandHelper$executeCommandSuspended$2$1;->this$0:Lcom/android/quickstep/OverviewCommandHelper;

    iget-object v1, p0, Lcom/android/quickstep/OverviewCommandHelper$executeCommandSuspended$2$1;->$command:Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;

    invoke-static {v0, v1, p1}, Lcom/android/quickstep/OverviewCommandHelper;->access$cancelCommand(Lcom/android/quickstep/OverviewCommandHelper;Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;Ljava/lang/Throwable;)V

    .line 3
    iget-object p0, p0, Lcom/android/quickstep/OverviewCommandHelper$executeCommandSuspended$2$1;->$isResumed:Lkotlin/jvm/internal/z;

    const/4 p1, 0x1

    iput-boolean p1, p0, Lkotlin/jvm/internal/z;->g:Z

    return-void
.end method
