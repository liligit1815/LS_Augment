.class public final synthetic LW1/f;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Lu4/a;


# instance fields
.field public final synthetic g:LW1/l;

.field public final synthetic h:Lu4/a;


# direct methods
.method public synthetic constructor <init>(LW1/l;Lu4/a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LW1/f;->g:LW1/l;

    .line 5
    .line 6
    iput-object p2, p0, LW1/f;->h:Lu4/a;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, LW1/f;->g:LW1/l;

    .line 2
    .line 3
    iget-object p0, p0, LW1/f;->h:Lu4/a;

    .line 4
    .line 5
    invoke-static {v0, p0}, LW1/l;->g(LW1/l;Lu4/a;)Lh4/t;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method
