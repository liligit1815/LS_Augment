.class public abstract Landroidx/preference/DialogPreference;
.super Landroidx/preference/Preference;
.source "DialogPreference.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/preference/DialogPreference$a;
    }
.end annotation


# instance fields
.field private W:Ljava/lang/CharSequence;

.field private X:Ljava/lang/CharSequence;

.field private Y:Landroid/graphics/drawable/Drawable;

.field private Z:Ljava/lang/CharSequence;

.field private a0:Ljava/lang/CharSequence;

.field private b0:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2

    .line 12
    sget v0, Landroidx/preference/i;->b:I

    const v1, 0x1010091

    invoke-static {p1, v0, v1}, LA/l;->a(Landroid/content/Context;II)I

    move-result v0

    invoke-direct {p0, p1, p2, v0}, Landroidx/preference/DialogPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1

    const/4 v0, 0x0

    .line 11
    invoke-direct {p0, p1, p2, p3, v0}, Landroidx/preference/DialogPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 1

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, Landroidx/preference/Preference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 2
    sget-object v0, Landroidx/preference/q;->j:[I

    invoke-virtual {p1, p2, v0, p3, p4}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object p1

    .line 3
    sget p2, Landroidx/preference/q;->t:I

    sget p3, Landroidx/preference/q;->k:I

    invoke-static {p1, p2, p3}, LA/l;->m(Landroid/content/res/TypedArray;II)Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Landroidx/preference/DialogPreference;->W:Ljava/lang/CharSequence;

    if-nez p2, :cond_0

    .line 4
    invoke-virtual {p0}, Landroidx/preference/Preference;->I()Ljava/lang/CharSequence;

    move-result-object p2

    iput-object p2, p0, Landroidx/preference/DialogPreference;->W:Ljava/lang/CharSequence;

    .line 5
    :cond_0
    sget p2, Landroidx/preference/q;->s:I

    sget p3, Landroidx/preference/q;->l:I

    invoke-static {p1, p2, p3}, LA/l;->m(Landroid/content/res/TypedArray;II)Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Landroidx/preference/DialogPreference;->X:Ljava/lang/CharSequence;

    .line 6
    sget p2, Landroidx/preference/q;->q:I

    sget p3, Landroidx/preference/q;->m:I

    invoke-static {p1, p2, p3}, LA/l;->c(Landroid/content/res/TypedArray;II)Landroid/graphics/drawable/Drawable;

    move-result-object p2

    iput-object p2, p0, Landroidx/preference/DialogPreference;->Y:Landroid/graphics/drawable/Drawable;

    .line 7
    sget p2, Landroidx/preference/q;->v:I

    sget p3, Landroidx/preference/q;->n:I

    invoke-static {p1, p2, p3}, LA/l;->m(Landroid/content/res/TypedArray;II)Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Landroidx/preference/DialogPreference;->Z:Ljava/lang/CharSequence;

    .line 8
    sget p2, Landroidx/preference/q;->u:I

    sget p3, Landroidx/preference/q;->o:I

    invoke-static {p1, p2, p3}, LA/l;->m(Landroid/content/res/TypedArray;II)Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Landroidx/preference/DialogPreference;->a0:Ljava/lang/CharSequence;

    .line 9
    sget p2, Landroidx/preference/q;->r:I

    sget p3, Landroidx/preference/q;->p:I

    const/4 p4, 0x0

    invoke-static {p1, p2, p3, p4}, LA/l;->l(Landroid/content/res/TypedArray;III)I

    move-result p2

    iput p2, p0, Landroidx/preference/DialogPreference;->b0:I

    .line 10
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    return-void
.end method


# virtual methods
.method public U0()Landroid/graphics/drawable/Drawable;
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/preference/DialogPreference;->Y:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    return-object p0
.end method

.method public V0()I
    .locals 0

    .line 1
    iget p0, p0, Landroidx/preference/DialogPreference;->b0:I

    .line 2
    .line 3
    return p0
.end method

.method public W0()Ljava/lang/CharSequence;
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/preference/DialogPreference;->X:Ljava/lang/CharSequence;

    .line 2
    .line 3
    return-object p0
.end method

.method protected X()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroidx/preference/Preference;->E()Landroidx/preference/f;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p0}, Landroidx/preference/f;->s(Landroidx/preference/Preference;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public X0()Ljava/lang/CharSequence;
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/preference/DialogPreference;->W:Ljava/lang/CharSequence;

    .line 2
    .line 3
    return-object p0
.end method

.method public Y0()Ljava/lang/CharSequence;
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/preference/DialogPreference;->a0:Ljava/lang/CharSequence;

    .line 2
    .line 3
    return-object p0
.end method

.method public Z0()Ljava/lang/CharSequence;
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/preference/DialogPreference;->Z:Ljava/lang/CharSequence;

    .line 2
    .line 3
    return-object p0
.end method
