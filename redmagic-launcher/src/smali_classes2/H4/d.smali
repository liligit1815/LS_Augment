.class public final synthetic LH4/d;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Lu4/q;


# instance fields
.field public final synthetic g:Ljava/lang/Object;

.field public final synthetic h:LH4/e;

.field public final synthetic i:LN4/b;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;LH4/e;LN4/b;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LH4/d;->g:Ljava/lang/Object;

    .line 5
    .line 6
    iput-object p2, p0, LH4/d;->h:LH4/e;

    .line 7
    .line 8
    iput-object p3, p0, LH4/d;->i:LN4/b;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 6

    .line 1
    iget-object v0, p0, LH4/d;->g:Ljava/lang/Object;

    .line 2
    .line 3
    iget-object v1, p0, LH4/d;->h:LH4/e;

    .line 4
    .line 5
    iget-object v2, p0, LH4/d;->i:LN4/b;

    .line 6
    .line 7
    move-object v3, p1

    .line 8
    check-cast v3, Ljava/lang/Throwable;

    .line 9
    .line 10
    move-object v5, p3

    .line 11
    check-cast v5, Ll4/g;

    .line 12
    .line 13
    move-object v4, p2

    .line 14
    invoke-static/range {v0 .. v5}, LH4/e;->b(Ljava/lang/Object;LH4/e;LN4/b;Ljava/lang/Throwable;Ljava/lang/Object;Ll4/g;)Lh4/t;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method
