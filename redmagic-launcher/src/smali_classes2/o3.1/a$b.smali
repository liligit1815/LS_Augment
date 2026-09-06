.class final Lo3/a$b;
.super Landroid/graphics/drawable/Drawable$ConstantState;
.source "RippleDrawableCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lo3/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "b"
.end annotation


# instance fields
.field a:Lq3/g;

.field b:Z


# direct methods
.method public constructor <init>(Lo3/a$b;)V
    .locals 1

    .line 4
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable$ConstantState;-><init>()V

    .line 5
    iget-object v0, p1, Lo3/a$b;->a:Lq3/g;

    invoke-virtual {v0}, Lq3/g;->getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable$ConstantState;->newDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    check-cast v0, Lq3/g;

    iput-object v0, p0, Lo3/a$b;->a:Lq3/g;

    .line 6
    iget-boolean p1, p1, Lo3/a$b;->b:Z

    iput-boolean p1, p0, Lo3/a$b;->b:Z

    return-void
.end method

.method public constructor <init>(Lq3/g;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable$ConstantState;-><init>()V

    .line 2
    iput-object p1, p0, Lo3/a$b;->a:Lq3/g;

    const/4 p1, 0x0

    .line 3
    iput-boolean p1, p0, Lo3/a$b;->b:Z

    return-void
.end method


# virtual methods
.method public a()Lo3/a;
    .locals 2

    .line 1
    new-instance v0, Lo3/a;

    .line 2
    .line 3
    new-instance v1, Lo3/a$b;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Lo3/a$b;-><init>(Lo3/a$b;)V

    .line 6
    .line 7
    .line 8
    const/4 p0, 0x0

    .line 9
    invoke-direct {v0, v1, p0}, Lo3/a;-><init>(Lo3/a$b;Lo3/a$a;)V

    .line 10
    .line 11
    .line 12
    return-object v0
.end method

.method public getChangingConfigurations()I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public bridge synthetic newDrawable()Landroid/graphics/drawable/Drawable;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lo3/a$b;->a()Lo3/a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
