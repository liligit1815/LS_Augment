.class public Lq3/g$c;
.super Landroid/graphics/drawable/Drawable$ConstantState;
.source "MaterialShapeDrawable.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lq3/g;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xc
    name = "c"
.end annotation


# instance fields
.field a:Lq3/k;

.field b:Li3/a;

.field c:Landroid/graphics/ColorFilter;

.field d:Landroid/content/res/ColorStateList;

.field e:Landroid/content/res/ColorStateList;

.field f:Landroid/content/res/ColorStateList;

.field g:Landroid/content/res/ColorStateList;

.field h:Landroid/graphics/PorterDuff$Mode;

.field i:Landroid/graphics/Rect;

.field j:F

.field k:F

.field l:F

.field m:I

.field n:F

.field o:F

.field p:F

.field q:I

.field r:I

.field s:I

.field t:I

.field u:Z

.field v:Landroid/graphics/Paint$Style;


# direct methods
.method public constructor <init>(Lq3/g$c;)V
    .locals 2

    .line 22
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable$ConstantState;-><init>()V

    const/4 v0, 0x0

    .line 23
    iput-object v0, p0, Lq3/g$c;->d:Landroid/content/res/ColorStateList;

    .line 24
    iput-object v0, p0, Lq3/g$c;->e:Landroid/content/res/ColorStateList;

    .line 25
    iput-object v0, p0, Lq3/g$c;->f:Landroid/content/res/ColorStateList;

    .line 26
    iput-object v0, p0, Lq3/g$c;->g:Landroid/content/res/ColorStateList;

    .line 27
    sget-object v1, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    iput-object v1, p0, Lq3/g$c;->h:Landroid/graphics/PorterDuff$Mode;

    .line 28
    iput-object v0, p0, Lq3/g$c;->i:Landroid/graphics/Rect;

    const/high16 v0, 0x3f800000    # 1.0f

    .line 29
    iput v0, p0, Lq3/g$c;->j:F

    .line 30
    iput v0, p0, Lq3/g$c;->k:F

    const/16 v0, 0xff

    .line 31
    iput v0, p0, Lq3/g$c;->m:I

    const/4 v0, 0x0

    .line 32
    iput v0, p0, Lq3/g$c;->n:F

    .line 33
    iput v0, p0, Lq3/g$c;->o:F

    .line 34
    iput v0, p0, Lq3/g$c;->p:F

    const/4 v0, 0x0

    .line 35
    iput v0, p0, Lq3/g$c;->q:I

    .line 36
    iput v0, p0, Lq3/g$c;->r:I

    .line 37
    iput v0, p0, Lq3/g$c;->s:I

    .line 38
    iput v0, p0, Lq3/g$c;->t:I

    .line 39
    iput-boolean v0, p0, Lq3/g$c;->u:Z

    .line 40
    sget-object v0, Landroid/graphics/Paint$Style;->FILL_AND_STROKE:Landroid/graphics/Paint$Style;

    iput-object v0, p0, Lq3/g$c;->v:Landroid/graphics/Paint$Style;

    .line 41
    iget-object v0, p1, Lq3/g$c;->a:Lq3/k;

    iput-object v0, p0, Lq3/g$c;->a:Lq3/k;

    .line 42
    iget-object v0, p1, Lq3/g$c;->b:Li3/a;

    iput-object v0, p0, Lq3/g$c;->b:Li3/a;

    .line 43
    iget v0, p1, Lq3/g$c;->l:F

    iput v0, p0, Lq3/g$c;->l:F

    .line 44
    iget-object v0, p1, Lq3/g$c;->c:Landroid/graphics/ColorFilter;

    iput-object v0, p0, Lq3/g$c;->c:Landroid/graphics/ColorFilter;

    .line 45
    iget-object v0, p1, Lq3/g$c;->d:Landroid/content/res/ColorStateList;

    iput-object v0, p0, Lq3/g$c;->d:Landroid/content/res/ColorStateList;

    .line 46
    iget-object v0, p1, Lq3/g$c;->e:Landroid/content/res/ColorStateList;

    iput-object v0, p0, Lq3/g$c;->e:Landroid/content/res/ColorStateList;

    .line 47
    iget-object v0, p1, Lq3/g$c;->h:Landroid/graphics/PorterDuff$Mode;

    iput-object v0, p0, Lq3/g$c;->h:Landroid/graphics/PorterDuff$Mode;

    .line 48
    iget-object v0, p1, Lq3/g$c;->g:Landroid/content/res/ColorStateList;

    iput-object v0, p0, Lq3/g$c;->g:Landroid/content/res/ColorStateList;

    .line 49
    iget v0, p1, Lq3/g$c;->m:I

    iput v0, p0, Lq3/g$c;->m:I

    .line 50
    iget v0, p1, Lq3/g$c;->j:F

    iput v0, p0, Lq3/g$c;->j:F

    .line 51
    iget v0, p1, Lq3/g$c;->s:I

    iput v0, p0, Lq3/g$c;->s:I

    .line 52
    iget v0, p1, Lq3/g$c;->q:I

    iput v0, p0, Lq3/g$c;->q:I

    .line 53
    iget-boolean v0, p1, Lq3/g$c;->u:Z

    iput-boolean v0, p0, Lq3/g$c;->u:Z

    .line 54
    iget v0, p1, Lq3/g$c;->k:F

    iput v0, p0, Lq3/g$c;->k:F

    .line 55
    iget v0, p1, Lq3/g$c;->n:F

    iput v0, p0, Lq3/g$c;->n:F

    .line 56
    iget v0, p1, Lq3/g$c;->o:F

    iput v0, p0, Lq3/g$c;->o:F

    .line 57
    iget v0, p1, Lq3/g$c;->p:F

    iput v0, p0, Lq3/g$c;->p:F

    .line 58
    iget v0, p1, Lq3/g$c;->r:I

    iput v0, p0, Lq3/g$c;->r:I

    .line 59
    iget v0, p1, Lq3/g$c;->t:I

    iput v0, p0, Lq3/g$c;->t:I

    .line 60
    iget-object v0, p1, Lq3/g$c;->f:Landroid/content/res/ColorStateList;

    iput-object v0, p0, Lq3/g$c;->f:Landroid/content/res/ColorStateList;

    .line 61
    iget-object v0, p1, Lq3/g$c;->v:Landroid/graphics/Paint$Style;

    iput-object v0, p0, Lq3/g$c;->v:Landroid/graphics/Paint$Style;

    .line 62
    iget-object v0, p1, Lq3/g$c;->i:Landroid/graphics/Rect;

    if-eqz v0, :cond_0

    .line 63
    new-instance v0, Landroid/graphics/Rect;

    iget-object p1, p1, Lq3/g$c;->i:Landroid/graphics/Rect;

    invoke-direct {v0, p1}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    iput-object v0, p0, Lq3/g$c;->i:Landroid/graphics/Rect;

    :cond_0
    return-void
.end method

.method public constructor <init>(Lq3/k;Li3/a;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable$ConstantState;-><init>()V

    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lq3/g$c;->d:Landroid/content/res/ColorStateList;

    .line 3
    iput-object v0, p0, Lq3/g$c;->e:Landroid/content/res/ColorStateList;

    .line 4
    iput-object v0, p0, Lq3/g$c;->f:Landroid/content/res/ColorStateList;

    .line 5
    iput-object v0, p0, Lq3/g$c;->g:Landroid/content/res/ColorStateList;

    .line 6
    sget-object v1, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    iput-object v1, p0, Lq3/g$c;->h:Landroid/graphics/PorterDuff$Mode;

    .line 7
    iput-object v0, p0, Lq3/g$c;->i:Landroid/graphics/Rect;

    const/high16 v0, 0x3f800000    # 1.0f

    .line 8
    iput v0, p0, Lq3/g$c;->j:F

    .line 9
    iput v0, p0, Lq3/g$c;->k:F

    const/16 v0, 0xff

    .line 10
    iput v0, p0, Lq3/g$c;->m:I

    const/4 v0, 0x0

    .line 11
    iput v0, p0, Lq3/g$c;->n:F

    .line 12
    iput v0, p0, Lq3/g$c;->o:F

    .line 13
    iput v0, p0, Lq3/g$c;->p:F

    const/4 v0, 0x0

    .line 14
    iput v0, p0, Lq3/g$c;->q:I

    .line 15
    iput v0, p0, Lq3/g$c;->r:I

    .line 16
    iput v0, p0, Lq3/g$c;->s:I

    .line 17
    iput v0, p0, Lq3/g$c;->t:I

    .line 18
    iput-boolean v0, p0, Lq3/g$c;->u:Z

    .line 19
    sget-object v0, Landroid/graphics/Paint$Style;->FILL_AND_STROKE:Landroid/graphics/Paint$Style;

    iput-object v0, p0, Lq3/g$c;->v:Landroid/graphics/Paint$Style;

    .line 20
    iput-object p1, p0, Lq3/g$c;->a:Lq3/k;

    .line 21
    iput-object p2, p0, Lq3/g$c;->b:Li3/a;

    return-void
.end method


# virtual methods
.method public getChangingConfigurations()I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public newDrawable()Landroid/graphics/drawable/Drawable;
    .locals 1

    .line 1
    new-instance v0, Lq3/g;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lq3/g;-><init>(Lq3/g$c;)V

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x1

    .line 7
    invoke-static {v0, p0}, Lq3/g;->e(Lq3/g;Z)Z

    .line 8
    .line 9
    .line 10
    return-object v0
.end method
