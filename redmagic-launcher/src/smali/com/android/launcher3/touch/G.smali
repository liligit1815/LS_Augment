.class public interface abstract Lcom/android/launcher3/touch/G;
.super Ljava/lang/Object;
.source "PagedOrientationHandler.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/touch/G$c;,
        Lcom/android/launcher3/touch/G$b;,
        Lcom/android/launcher3/touch/G$a;
    }
.end annotation


# static fields
.field public static final a:Lcom/android/launcher3/touch/G;

.field public static final b:Lcom/android/launcher3/touch/G$c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/touch/G$c<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field public static final c:Lcom/android/launcher3/touch/G$c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/touch/G$c<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field public static final d:Lcom/android/launcher3/touch/G$b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/touch/G$b<",
            "Landroid/graphics/Canvas;",
            ">;"
        }
    .end annotation
.end field

.field public static final e:Lcom/android/launcher3/touch/G$b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/touch/G$b<",
            "Landroid/graphics/Matrix;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/launcher3/touch/i;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/launcher3/touch/i;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/android/launcher3/touch/G;->a:Lcom/android/launcher3/touch/G;

    .line 7
    .line 8
    new-instance v0, Lcom/android/launcher3/touch/C;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/android/launcher3/touch/C;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/android/launcher3/touch/G;->b:Lcom/android/launcher3/touch/G$c;

    .line 14
    .line 15
    new-instance v0, Lcom/android/launcher3/touch/D;

    .line 16
    .line 17
    invoke-direct {v0}, Lcom/android/launcher3/touch/D;-><init>()V

    .line 18
    .line 19
    .line 20
    sput-object v0, Lcom/android/launcher3/touch/G;->c:Lcom/android/launcher3/touch/G$c;

    .line 21
    .line 22
    new-instance v0, Lcom/android/launcher3/touch/E;

    .line 23
    .line 24
    invoke-direct {v0}, Lcom/android/launcher3/touch/E;-><init>()V

    .line 25
    .line 26
    .line 27
    sput-object v0, Lcom/android/launcher3/touch/G;->d:Lcom/android/launcher3/touch/G$b;

    .line 28
    .line 29
    new-instance v0, Lcom/android/launcher3/touch/F;

    .line 30
    .line 31
    invoke-direct {v0}, Lcom/android/launcher3/touch/F;-><init>()V

    .line 32
    .line 33
    .line 34
    sput-object v0, Lcom/android/launcher3/touch/G;->e:Lcom/android/launcher3/touch/G$b;

    .line 35
    .line 36
    return-void
.end method


# virtual methods
.method public abstract calculateDoubleGridSize(Landroid/content/Context;Lcom/android/launcher3/h0;Landroid/graphics/Rect;F)Landroid/graphics/Rect;
.end method

.method public abstract calculateDoubleGridTaskSize(Landroid/content/Context;Lcom/android/launcher3/h0;Landroid/graphics/Rect;F)Landroid/graphics/Rect;
.end method

.method public abstract calculateMultiGridSize(Landroid/content/Context;Lcom/android/launcher3/h0;Landroid/graphics/Rect;IF)Landroid/graphics/Rect;
.end method

.method public abstract calculateMultiGridTaskSize(Landroid/content/Context;Lcom/android/launcher3/h0;Landroid/graphics/Rect;Lcom/android/launcher3/touch/G;IF)Landroid/graphics/Rect;
.end method

.method public abstract calculateSingleGridSize(Landroid/content/Context;Lcom/android/launcher3/h0;Landroid/graphics/Rect;F)Landroid/graphics/Rect;
.end method

.method public abstract calculateSingleGridTaskSize(Landroid/content/Context;Lcom/android/launcher3/h0;Landroid/graphics/Rect;F)Landroid/graphics/Rect;
.end method

.method public abstract calculateWindowRadiusToHome(Landroid/graphics/RectF;FF)F
.end method

.method public abstract getCenterForPage(Landroid/view/View;Landroid/graphics/Rect;)I
.end method

.method public abstract getChildBounds(Landroid/view/View;IIZ)Lcom/android/launcher3/touch/G$a;
.end method

.method public abstract getChildStart(Landroid/view/View;)I
.end method

.method public abstract getMeasuredSize(Landroid/view/View;)I
.end method

.method public abstract getPrimaryDirection(Landroid/view/MotionEvent;I)F
.end method

.method public abstract getPrimaryScale(Landroid/view/View;)F
.end method

.method public abstract getPrimaryScroll(Landroid/view/View;)I
.end method

.method public abstract getPrimaryValue(FF)F
.end method

.method public abstract getPrimaryValue(II)I
.end method

.method public abstract getPrimaryVelocity(Landroid/view/VelocityTracker;I)F
.end method

.method public abstract getRecentsRtlSetting(Landroid/content/res/Resources;)Z
.end method

.method public abstract getScrollOffsetEnd(Landroid/view/View;Landroid/graphics/Rect;)I
.end method

.method public abstract getScrollOffsetStart(Landroid/view/View;Landroid/graphics/Rect;)I
.end method

.method public abstract getSecondaryDirection(Landroid/view/MotionEvent;I)F
.end method

.method public abstract getSecondaryValue(FF)F
.end method

.method public abstract getSecondaryValue(II)I
.end method

.method public abstract setMaxScroll(Landroid/view/accessibility/AccessibilityEvent;I)V
.end method

.method public abstract setPrimary(Ljava/lang/Object;Lcom/android/launcher3/touch/G$c;I)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;",
            "Lcom/android/launcher3/touch/G$c<",
            "TT;>;I)V"
        }
    .end annotation
.end method
