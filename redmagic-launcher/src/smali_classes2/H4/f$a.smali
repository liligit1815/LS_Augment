.class final synthetic LH4/f$a;
.super Lkotlin/jvm/internal/m;
.source "BufferedChannel.kt"

# interfaces
.implements Lu4/p;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = LH4/f;->y()LB4/f;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1000
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/jvm/internal/m;",
        "Lu4/p<",
        "Ljava/lang/Long;",
        "LH4/m<",
        "TE;>;",
        "LH4/m<",
        "TE;>;>;"
    }
.end annotation


# static fields
.field public static final g:LH4/f$a;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, LH4/f$a;

    .line 2
    .line 3
    invoke-direct {v0}, LH4/f$a;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, LH4/f$a;->g:LH4/f$a;

    .line 7
    .line 8
    return-void
.end method

.method constructor <init>()V
    .locals 6

    .line 1
    const-string v4, "createSegment(JLkotlinx/coroutines/channels/ChannelSegment;)Lkotlinx/coroutines/channels/ChannelSegment;"

    .line 2
    .line 3
    const/4 v5, 0x1

    .line 4
    const/4 v1, 0x2

    .line 5
    const-class v2, LH4/f;

    .line 6
    .line 7
    const-string v3, "createSegment"

    .line 8
    .line 9
    move-object v0, p0

    .line 10
    invoke-direct/range {v0 .. v5}, Lkotlin/jvm/internal/m;-><init>(ILjava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    .line 11
    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public final b(JLH4/m;)LH4/m;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "LH4/m<",
            "TE;>;)",
            "LH4/m<",
            "TE;>;"
        }
    .end annotation

    .line 1
    invoke-static {p1, p2, p3}, LH4/f;->c(JLH4/m;)LH4/m;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .line 1
    check-cast p1, Ljava/lang/Number;

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Number;->longValue()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    check-cast p2, LH4/m;

    .line 8
    .line 9
    invoke-virtual {p0, v0, v1, p2}, LH4/f$a;->b(JLH4/m;)LH4/m;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method
