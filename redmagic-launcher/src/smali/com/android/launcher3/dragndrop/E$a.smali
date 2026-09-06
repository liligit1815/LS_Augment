.class Lcom/android/launcher3/dragndrop/E$a;
.super Landroid/graphics/drawable/Drawable;
.source "FolderAdaptiveIcon.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/dragndrop/E;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/dragndrop/E$a$a;
    }
.end annotation


# instance fields
.field private final a:Ls1/e;


# direct methods
.method constructor <init>(Ls1/e;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/dragndrop/E$a;->a:Ls1/e;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/dragndrop/E$a;->a:Ls1/e;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ls1/e;->c(Landroid/graphics/Canvas;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;
    .locals 1

    .line 1
    new-instance v0, Lcom/android/launcher3/dragndrop/E$a$a;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/dragndrop/E$a;->a:Ls1/e;

    .line 4
    .line 5
    invoke-direct {v0, p0}, Lcom/android/launcher3/dragndrop/E$a$a;-><init>(Ls1/e;)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method

.method public getOpacity()I
    .locals 0

    .line 1
    const/4 p0, -0x3

    .line 2
    return p0
.end method

.method public setAlpha(I)V
    .locals 0

    .line 1
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .locals 0

    .line 1
    return-void
.end method
