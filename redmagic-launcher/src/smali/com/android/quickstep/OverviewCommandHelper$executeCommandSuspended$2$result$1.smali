.class final Lcom/android/quickstep/OverviewCommandHelper$executeCommandSuspended$2$result$1;
.super Ljava/lang/Object;
.source "OverviewCommandHelper.kt"

# interfaces
.implements Lu4/a;


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
        "Lu4/a<",
        "Lh4/t;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic $command:Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;

.field final synthetic $continuation:LF4/k;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "LF4/k<",
            "Lh4/t;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic $isResumed:Lkotlin/jvm/internal/z;


# direct methods
.method constructor <init>(Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;Lkotlin/jvm/internal/z;LF4/k;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;",
            "Lkotlin/jvm/internal/z;",
            "LF4/k<",
            "-",
            "Lh4/t;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/OverviewCommandHelper$executeCommandSuspended$2$result$1;->$command:Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/quickstep/OverviewCommandHelper$executeCommandSuspended$2$result$1;->$isResumed:Lkotlin/jvm/internal/z;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/android/quickstep/OverviewCommandHelper$executeCommandSuspended$2$result$1;->$continuation:LF4/k;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public bridge synthetic invoke()Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/OverviewCommandHelper$executeCommandSuspended$2$result$1;->invoke()V

    sget-object p0, Lh4/t;->a:Lh4/t;

    return-object p0
.end method

.method public final invoke()V
    .locals 3

    .line 2
    iget-object v0, p0, Lcom/android/quickstep/OverviewCommandHelper$executeCommandSuspended$2$result$1;->$command:Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;

    iget-object v1, p0, Lcom/android/quickstep/OverviewCommandHelper$executeCommandSuspended$2$result$1;->$isResumed:Lkotlin/jvm/internal/z;

    iget-object p0, p0, Lcom/android/quickstep/OverviewCommandHelper$executeCommandSuspended$2$result$1;->$continuation:LF4/k;

    const/4 v2, 0x1

    invoke-static {v0, v1, p0, v2}, Lcom/android/quickstep/OverviewCommandHelper;->access$executeCommandSuspended$lambda$9$processResult(Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;Lkotlin/jvm/internal/z;LF4/k;Z)V

    return-void
.end method
