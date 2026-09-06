.class public final synthetic LM2/h;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Lu4/l;


# instance fields
.field public final synthetic g:Landroidx/dynamicanimation/animation/g;

.field public final synthetic h:Z

.field public final synthetic i:F

.field public final synthetic j:F

.field public final synthetic k:Landroidx/dynamicanimation/animation/e;


# direct methods
.method public synthetic constructor <init>(Landroidx/dynamicanimation/animation/g;ZFFLandroidx/dynamicanimation/animation/e;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LM2/h;->g:Landroidx/dynamicanimation/animation/g;

    .line 5
    .line 6
    iput-boolean p2, p0, LM2/h;->h:Z

    .line 7
    .line 8
    iput p3, p0, LM2/h;->i:F

    .line 9
    .line 10
    iput p4, p0, LM2/h;->j:F

    .line 11
    .line 12
    iput-object p5, p0, LM2/h;->k:Landroidx/dynamicanimation/animation/e;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 6

    .line 1
    iget-object v0, p0, LM2/h;->g:Landroidx/dynamicanimation/animation/g;

    .line 2
    .line 3
    iget-boolean v1, p0, LM2/h;->h:Z

    .line 4
    .line 5
    iget v2, p0, LM2/h;->i:F

    .line 6
    .line 7
    iget v3, p0, LM2/h;->j:F

    .line 8
    .line 9
    iget-object v4, p0, LM2/h;->k:Landroidx/dynamicanimation/animation/e;

    .line 10
    .line 11
    move-object v5, p1

    .line 12
    check-cast v5, LM2/i$e;

    .line 13
    .line 14
    invoke-static/range {v0 .. v5}, LM2/i;->a(Landroidx/dynamicanimation/animation/g;ZFFLandroidx/dynamicanimation/animation/e;LM2/i$e;)Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method
