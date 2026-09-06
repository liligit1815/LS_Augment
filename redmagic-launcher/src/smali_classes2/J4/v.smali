.class public final LJ4/v;
.super Ljava/lang/Object;
.source "SafeCollector.kt"


# static fields
.field private static final a:Lu4/q;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lu4/q<",
            "LI4/e<",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/lang/Object;",
            "Ll4/d<",
            "-",
            "Lh4/t;",
            ">;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    sget-object v0, LJ4/v$a;->g:LJ4/v$a;

    .line 2
    .line 3
    const-string v1, "null cannot be cast to non-null type kotlin.Function3<kotlinx.coroutines.flow.FlowCollector<kotlin.Any?>, kotlin.Any?, kotlin.coroutines.Continuation<kotlin.Unit>, kotlin.Any?>"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const/4 v1, 0x3

    .line 9
    invoke-static {v0, v1}, Lkotlin/jvm/internal/H;->d(Ljava/lang/Object;I)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Lu4/q;

    .line 14
    .line 15
    sput-object v0, LJ4/v;->a:Lu4/q;

    .line 16
    .line 17
    return-void
.end method

.method public static final synthetic a()Lu4/q;
    .locals 1

    .line 1
    sget-object v0, LJ4/v;->a:Lu4/q;

    .line 2
    .line 3
    return-object v0
.end method
