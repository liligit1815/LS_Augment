.class Lcom/android/launcher3/dragndrop/E$b;
.super Landroid/graphics/drawable/Drawable$ConstantState;
.source "FolderAdaptiveIcon.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/dragndrop/E;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "b"
.end annotation


# instance fields
.field private final a:Landroid/graphics/drawable/Drawable$ConstantState;

.field private final b:Landroid/graphics/drawable/Drawable$ConstantState;

.field private final c:Landroid/graphics/drawable/Drawable$ConstantState;

.field private final d:Landroid/graphics/Path;


# direct methods
.method constructor <init>(Landroid/graphics/drawable/Drawable$ConstantState;Landroid/graphics/drawable/Drawable$ConstantState;Landroid/graphics/drawable/Drawable$ConstantState;Landroid/graphics/Path;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable$ConstantState;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/dragndrop/E$b;->a:Landroid/graphics/drawable/Drawable$ConstantState;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/launcher3/dragndrop/E$b;->b:Landroid/graphics/drawable/Drawable$ConstantState;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/android/launcher3/dragndrop/E$b;->c:Landroid/graphics/drawable/Drawable$ConstantState;

    .line 9
    .line 10
    iput-object p4, p0, Lcom/android/launcher3/dragndrop/E$b;->d:Landroid/graphics/Path;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public getChangingConfigurations()I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/E$b;->a:Landroid/graphics/drawable/Drawable$ConstantState;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable$ConstantState;->getChangingConfigurations()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Lcom/android/launcher3/dragndrop/E$b;->b:Landroid/graphics/drawable/Drawable$ConstantState;

    .line 8
    .line 9
    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable$ConstantState;->getChangingConfigurations()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    and-int/2addr v0, v1

    .line 14
    iget-object p0, p0, Lcom/android/launcher3/dragndrop/E$b;->c:Landroid/graphics/drawable/Drawable$ConstantState;

    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable$ConstantState;->getChangingConfigurations()I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    and-int/2addr p0, v0

    .line 21
    return p0
.end method

.method public newDrawable()Landroid/graphics/drawable/Drawable;
    .locals 6

    .line 1
    new-instance v0, Lcom/android/launcher3/dragndrop/E;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/dragndrop/E$b;->a:Landroid/graphics/drawable/Drawable$ConstantState;

    .line 4
    .line 5
    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable$ConstantState;->newDrawable()Landroid/graphics/drawable/Drawable;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    iget-object v2, p0, Lcom/android/launcher3/dragndrop/E$b;->b:Landroid/graphics/drawable/Drawable$ConstantState;

    .line 10
    .line 11
    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable$ConstantState;->newDrawable()Landroid/graphics/drawable/Drawable;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    iget-object v3, p0, Lcom/android/launcher3/dragndrop/E$b;->c:Landroid/graphics/drawable/Drawable$ConstantState;

    .line 16
    .line 17
    invoke-virtual {v3}, Landroid/graphics/drawable/Drawable$ConstantState;->newDrawable()Landroid/graphics/drawable/Drawable;

    .line 18
    .line 19
    .line 20
    move-result-object v3

    .line 21
    iget-object v4, p0, Lcom/android/launcher3/dragndrop/E$b;->d:Landroid/graphics/Path;

    .line 22
    .line 23
    const/4 v5, 0x0

    .line 24
    invoke-direct/range {v0 .. v5}, Lcom/android/launcher3/dragndrop/E;-><init>(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/Path;Lcom/android/launcher3/dragndrop/F;)V

    .line 25
    .line 26
    .line 27
    return-object v0
.end method
