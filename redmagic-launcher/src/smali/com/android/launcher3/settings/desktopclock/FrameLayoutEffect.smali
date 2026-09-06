.class public Lcom/android/launcher3/settings/desktopclock/FrameLayoutEffect;
.super Landroid/widget/FrameLayout;
.source "FrameLayoutEffect.java"

# interfaces
.implements Lcom/zte/mifavor/widget/MenuScrollerView$b;


# instance fields
.field private g:Z

.field private h:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 p2, 0x0

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/settings/desktopclock/FrameLayoutEffect;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 2
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public getIndex()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/settings/desktopclock/FrameLayoutEffect;->h:I

    .line 2
    .line 3
    return p0
.end method

.method public getIsSelected()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/settings/desktopclock/FrameLayoutEffect;->g:Z

    .line 2
    .line 3
    return p0
.end method

.method public setIndex(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/settings/desktopclock/FrameLayoutEffect;->h:I

    .line 2
    .line 3
    return-void
.end method

.method public setIsSelected(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/settings/desktopclock/FrameLayoutEffect;->g:Z

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    const p1, 0x7f0809f2

    .line 6
    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const p1, 0x7f0809f1

    .line 10
    .line 11
    .line 12
    :goto_0
    invoke-virtual {p0, p1}, Landroid/widget/FrameLayout;->setBackgroundResource(I)V

    .line 13
    .line 14
    .line 15
    return-void
.end method
