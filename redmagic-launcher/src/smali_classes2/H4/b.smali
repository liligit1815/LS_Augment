.class public final synthetic LH4/b;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Lu4/q;


# instance fields
.field public final synthetic g:LH4/e;


# direct methods
.method public synthetic constructor <init>(LH4/e;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LH4/b;->g:LH4/e;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, LH4/b;->g:LH4/e;

    .line 2
    .line 3
    check-cast p1, LN4/b;

    .line 4
    .line 5
    invoke-static {p0, p1, p2, p3}, LH4/e;->d(LH4/e;LN4/b;Ljava/lang/Object;Ljava/lang/Object;)Lu4/q;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method
