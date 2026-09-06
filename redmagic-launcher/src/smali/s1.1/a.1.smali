.class public final synthetic Ls1/a;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ls1/e;


# instance fields
.field public final synthetic a:Ls1/b;

.field public final synthetic b:Landroid/graphics/drawable/Drawable;

.field public final synthetic c:F

.field public final synthetic d:I


# direct methods
.method public synthetic constructor <init>(Ls1/b;Landroid/graphics/drawable/Drawable;FI)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ls1/a;->a:Ls1/b;

    .line 5
    .line 6
    iput-object p2, p0, Ls1/a;->b:Landroid/graphics/drawable/Drawable;

    .line 7
    .line 8
    iput p3, p0, Ls1/a;->c:F

    .line 9
    .line 10
    iput p4, p0, Ls1/a;->d:I

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final c(Landroid/graphics/Canvas;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ls1/a;->a:Ls1/b;

    .line 2
    .line 3
    iget-object v1, p0, Ls1/a;->b:Landroid/graphics/drawable/Drawable;

    .line 4
    .line 5
    iget v2, p0, Ls1/a;->c:F

    .line 6
    .line 7
    iget p0, p0, Ls1/a;->d:I

    .line 8
    .line 9
    invoke-static {v0, v1, v2, p0, p1}, Ls1/b;->b(Ls1/b;Landroid/graphics/drawable/Drawable;FILandroid/graphics/Canvas;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
