.class Landroidx/dynamicanimation/animation/e$f;
.super Landroidx/dynamicanimation/animation/g;
.source "DynamicAnimation.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/dynamicanimation/animation/e;-><init>(Landroidx/dynamicanimation/animation/h;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Landroidx/dynamicanimation/animation/h;

.field final synthetic b:Landroidx/dynamicanimation/animation/e;


# direct methods
.method constructor <init>(Landroidx/dynamicanimation/animation/e;Ljava/lang/String;Landroidx/dynamicanimation/animation/h;)V
    .locals 0

    .line 1
    iput-object p1, p0, Landroidx/dynamicanimation/animation/e$f;->b:Landroidx/dynamicanimation/animation/e;

    .line 2
    .line 3
    iput-object p3, p0, Landroidx/dynamicanimation/animation/e$f;->a:Landroidx/dynamicanimation/animation/h;

    .line 4
    .line 5
    invoke-direct {p0, p2}, Landroidx/dynamicanimation/animation/g;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public getValue(Ljava/lang/Object;)F
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/dynamicanimation/animation/e$f;->a:Landroidx/dynamicanimation/animation/h;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/dynamicanimation/animation/h;->a()F

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public setValue(Ljava/lang/Object;F)V
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/dynamicanimation/animation/e$f;->a:Landroidx/dynamicanimation/animation/h;

    .line 2
    .line 3
    invoke-virtual {p0, p2}, Landroidx/dynamicanimation/animation/h;->b(F)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
