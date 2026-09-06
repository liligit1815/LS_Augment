.class public final synthetic LW1/i;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Lu4/a;


# instance fields
.field public final synthetic g:LW1/z;

.field public final synthetic h:LW1/m;

.field public final synthetic i:LW1/l;

.field public final synthetic j:Lu4/a;


# direct methods
.method public synthetic constructor <init>(LW1/z;LW1/m;LW1/l;Lu4/a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LW1/i;->g:LW1/z;

    .line 5
    .line 6
    iput-object p2, p0, LW1/i;->h:LW1/m;

    .line 7
    .line 8
    iput-object p3, p0, LW1/i;->i:LW1/l;

    .line 9
    .line 10
    iput-object p4, p0, LW1/i;->j:Lu4/a;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .locals 3

    .line 1
    iget-object v0, p0, LW1/i;->g:LW1/z;

    .line 2
    .line 3
    iget-object v1, p0, LW1/i;->h:LW1/m;

    .line 4
    .line 5
    iget-object v2, p0, LW1/i;->i:LW1/l;

    .line 6
    .line 7
    iget-object p0, p0, LW1/i;->j:Lu4/a;

    .line 8
    .line 9
    invoke-static {v0, v1, v2, p0}, LW1/l;->f(LW1/z;LW1/m;LW1/l;Lu4/a;)Lh4/t;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method
