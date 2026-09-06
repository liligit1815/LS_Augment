.class public Lcom/android/launcher3/views/OptionsPopupView$a;
.super Ljava/lang/Object;
.source "OptionsPopupView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/views/OptionsPopupView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public final a:I

.field public final b:Ljava/lang/CharSequence;

.field public final c:Landroid/graphics/drawable/Drawable;

.field public final d:Lcom/android/launcher3/logging/StatsLogManager$d;

.field public final e:Landroid/view/View$OnLongClickListener;


# direct methods
.method public constructor <init>(Landroid/content/Context;IILcom/android/launcher3/logging/StatsLogManager$d;Landroid/view/View$OnLongClickListener;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p2, p0, Lcom/android/launcher3/views/OptionsPopupView$a;->a:I

    .line 5
    .line 6
    invoke-virtual {p1, p2}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    .line 7
    .line 8
    .line 9
    move-result-object p2

    .line 10
    iput-object p2, p0, Lcom/android/launcher3/views/OptionsPopupView$a;->b:Ljava/lang/CharSequence;

    .line 11
    .line 12
    invoke-static {p1, p3}, Lz/a;->e(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    iput-object p1, p0, Lcom/android/launcher3/views/OptionsPopupView$a;->c:Landroid/graphics/drawable/Drawable;

    .line 17
    .line 18
    iput-object p4, p0, Lcom/android/launcher3/views/OptionsPopupView$a;->d:Lcom/android/launcher3/logging/StatsLogManager$d;

    .line 19
    .line 20
    iput-object p5, p0, Lcom/android/launcher3/views/OptionsPopupView$a;->e:Landroid/view/View$OnLongClickListener;

    .line 21
    .line 22
    return-void
.end method
