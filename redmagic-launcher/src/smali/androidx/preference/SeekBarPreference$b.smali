.class Landroidx/preference/SeekBarPreference$b;
.super Ljava/lang/Object;
.source "SeekBarPreference.java"

# interfaces
.implements Landroid/view/View$OnKeyListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/preference/SeekBarPreference;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Landroidx/preference/SeekBarPreference;


# direct methods
.method constructor <init>(Landroidx/preference/SeekBarPreference;)V
    .locals 0

    .line 1
    iput-object p1, p0, Landroidx/preference/SeekBarPreference$b;->g:Landroidx/preference/SeekBarPreference;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onKey(Landroid/view/View;ILandroid/view/KeyEvent;)Z
    .locals 1

    .line 1
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const/4 v0, 0x0

    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    return v0

    .line 9
    :cond_0
    iget-object p0, p0, Landroidx/preference/SeekBarPreference$b;->g:Landroidx/preference/SeekBarPreference;

    .line 10
    .line 11
    iget-boolean p1, p0, Landroidx/preference/SeekBarPreference;->d0:Z

    .line 12
    .line 13
    if-nez p1, :cond_2

    .line 14
    .line 15
    const/16 p1, 0x15

    .line 16
    .line 17
    if-eq p2, p1, :cond_1

    .line 18
    .line 19
    const/16 p1, 0x16

    .line 20
    .line 21
    if-ne p2, p1, :cond_2

    .line 22
    .line 23
    :cond_1
    return v0

    .line 24
    :cond_2
    const/16 p1, 0x17

    .line 25
    .line 26
    if-eq p2, p1, :cond_5

    .line 27
    .line 28
    const/16 p1, 0x42

    .line 29
    .line 30
    if-ne p2, p1, :cond_3

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_3
    iget-object p0, p0, Landroidx/preference/SeekBarPreference;->b0:Landroid/widget/SeekBar;

    .line 34
    .line 35
    if-nez p0, :cond_4

    .line 36
    .line 37
    const-string p0, "SeekBarPreference"

    .line 38
    .line 39
    const-string p1, "SeekBar view is null and hence cannot be adjusted."

    .line 40
    .line 41
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 42
    .line 43
    .line 44
    return v0

    .line 45
    :cond_4
    invoke-virtual {p0, p2, p3}, Landroid/widget/SeekBar;->onKeyDown(ILandroid/view/KeyEvent;)Z

    .line 46
    .line 47
    .line 48
    move-result p0

    .line 49
    return p0

    .line 50
    :cond_5
    :goto_0
    return v0
.end method
