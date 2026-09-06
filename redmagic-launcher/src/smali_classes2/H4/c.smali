.class public final synthetic LH4/c;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Lu4/q;


# instance fields
.field public final synthetic g:Lu4/l;

.field public final synthetic h:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Lu4/l;Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LH4/c;->g:Lu4/l;

    .line 5
    .line 6
    iput-object p2, p0, LH4/c;->h:Ljava/lang/Object;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, LH4/c;->g:Lu4/l;

    .line 2
    .line 3
    iget-object p0, p0, LH4/c;->h:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast p1, Ljava/lang/Throwable;

    .line 6
    .line 7
    check-cast p3, Ll4/g;

    .line 8
    .line 9
    invoke-static {v0, p0, p1, p2, p3}, LH4/e;->e(Lu4/l;Ljava/lang/Object;Ljava/lang/Throwable;Ljava/lang/Object;Ll4/g;)Lh4/t;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method
