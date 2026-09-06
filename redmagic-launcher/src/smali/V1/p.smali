.class public final synthetic LV1/p;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Lu4/a;


# instance fields
.field public final synthetic g:LM2/i;

.field public final synthetic h:LV1/y;


# direct methods
.method public synthetic constructor <init>(LM2/i;LV1/y;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LV1/p;->g:LM2/i;

    .line 5
    .line 6
    iput-object p2, p0, LV1/p;->h:LV1/y;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, LV1/p;->g:LM2/i;

    .line 2
    .line 3
    iget-object p0, p0, LV1/p;->h:LV1/y;

    .line 4
    .line 5
    invoke-static {v0, p0}, LV1/y;->j(LM2/i;LV1/y;)Lh4/t;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method
