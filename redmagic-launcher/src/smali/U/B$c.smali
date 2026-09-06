.class final LU/B$c;
.super Lkotlin/jvm/internal/p;
.source "SvgPathParser.kt"

# interfaces
.implements Lu4/q;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = LU/B;->m(LU/B$a;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/jvm/internal/p;",
        "Lu4/q<",
        "Lo/e;",
        "Lo/e;",
        "Lo/e;",
        "Ljava/lang/Boolean;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic h:LU/B;


# direct methods
.method constructor <init>(LU/B;)V
    .locals 0

    .line 1
    iput-object p1, p0, LU/B$c;->h:LU/B;

    .line 2
    .line 3
    const/4 p1, 0x3

    .line 4
    invoke-direct {p0, p1}, Lkotlin/jvm/internal/p;-><init>(I)V

    .line 5
    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public final a(JJJ)Ljava/lang/Boolean;
    .locals 10

    .line 1
    iget-object v0, p0, LU/B$c;->h:LU/B;

    .line 2
    .line 3
    invoke-static {v0}, LU/B;->b(LU/B;)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, LU/B$c;->h:LU/B;

    .line 8
    .line 9
    invoke-static {v1}, LU/B;->c(LU/B;)J

    .line 10
    .line 11
    .line 12
    move-result-wide v2

    .line 13
    move-wide v4, p1

    .line 14
    move-wide v6, p3

    .line 15
    move-wide v8, p5

    .line 16
    invoke-static/range {v1 .. v9}, LU/B;->a(LU/B;JJJJ)LU/c;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 7

    .line 1
    check-cast p1, Lo/e;

    .line 2
    .line 3
    invoke-virtual {p1}, Lo/e;->g()J

    .line 4
    .line 5
    .line 6
    move-result-wide v1

    .line 7
    check-cast p2, Lo/e;

    .line 8
    .line 9
    invoke-virtual {p2}, Lo/e;->g()J

    .line 10
    .line 11
    .line 12
    move-result-wide v3

    .line 13
    check-cast p3, Lo/e;

    .line 14
    .line 15
    invoke-virtual {p3}, Lo/e;->g()J

    .line 16
    .line 17
    .line 18
    move-result-wide v5

    .line 19
    move-object v0, p0

    .line 20
    invoke-virtual/range {v0 .. v6}, LU/B$c;->a(JJJ)Ljava/lang/Boolean;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0
.end method
