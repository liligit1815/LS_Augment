.class public final synthetic LM2/g;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Landroidx/dynamicanimation/animation/e$q;


# instance fields
.field public final synthetic a:LM2/i;

.field public final synthetic b:Landroidx/dynamicanimation/animation/g;

.field public final synthetic c:Landroidx/dynamicanimation/animation/e;


# direct methods
.method public synthetic constructor <init>(LM2/i;Landroidx/dynamicanimation/animation/g;Landroidx/dynamicanimation/animation/e;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LM2/g;->a:LM2/i;

    .line 5
    .line 6
    iput-object p2, p0, LM2/g;->b:Landroidx/dynamicanimation/animation/g;

    .line 7
    .line 8
    iput-object p3, p0, LM2/g;->c:Landroidx/dynamicanimation/animation/e;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final onAnimationEnd(Landroidx/dynamicanimation/animation/e;ZFF)V
    .locals 7

    .line 1
    iget-object v0, p0, LM2/g;->a:LM2/i;

    .line 2
    .line 3
    iget-object v1, p0, LM2/g;->b:Landroidx/dynamicanimation/animation/g;

    .line 4
    .line 5
    iget-object v2, p0, LM2/g;->c:Landroidx/dynamicanimation/animation/e;

    .line 6
    .line 7
    move-object v3, p1

    .line 8
    move v4, p2

    .line 9
    move v5, p3

    .line 10
    move v6, p4

    .line 11
    invoke-static/range {v0 .. v6}, LM2/i;->e(LM2/i;Landroidx/dynamicanimation/animation/g;Landroidx/dynamicanimation/animation/e;Landroidx/dynamicanimation/animation/e;ZFF)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
