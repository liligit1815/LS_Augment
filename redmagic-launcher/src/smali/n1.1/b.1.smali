.class public final synthetic Ln1/b;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ls1/e;


# instance fields
.field public final synthetic a:Ln1/d;

.field public final synthetic b:F


# direct methods
.method public synthetic constructor <init>(Ln1/d;F)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ln1/b;->a:Ln1/d;

    .line 5
    .line 6
    iput p2, p0, Ln1/b;->b:F

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final c(Landroid/graphics/Canvas;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ln1/b;->a:Ln1/d;

    .line 2
    .line 3
    iget p0, p0, Ln1/b;->b:F

    .line 4
    .line 5
    invoke-static {v0, p0, p1}, Ln1/d;->c(Ln1/d;FLandroid/graphics/Canvas;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
