.class public final synthetic Lz1/o5;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Function;


# instance fields
.field public final synthetic a:Lz1/u5;

.field public final synthetic b:Lz1/u5$a;


# direct methods
.method public synthetic constructor <init>(Lz1/u5;Lz1/u5$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lz1/o5;->a:Lz1/u5;

    .line 5
    .line 6
    iput-object p2, p0, Lz1/o5;->b:Lz1/u5$a;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final apply(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Lz1/o5;->a:Lz1/u5;

    .line 2
    .line 3
    iget-object p0, p0, Lz1/o5;->b:Lz1/u5$a;

    .line 4
    .line 5
    check-cast p1, Lz1/Z4;

    .line 6
    .line 7
    invoke-static {v0, p0, p1}, Lz1/u5;->f(Lz1/u5;Lz1/u5$a;Lz1/Z4;)Ljava/util/stream/Stream;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method
