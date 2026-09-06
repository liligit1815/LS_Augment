.class Lcom/android/launcher3/views/FloatingIconView$b;
.super Ljava/lang/Object;
.source "FloatingIconView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/views/FloatingIconView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "b"
.end annotation


# instance fields
.field final a:Lcom/android/launcher3/model/data/y;

.field final b:Z

.field c:Ljava/util/function/Supplier;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/function/Supplier<",
            "Landroid/graphics/drawable/Drawable;",
            ">;"
        }
    .end annotation
.end field

.field d:Landroid/graphics/drawable/Drawable;

.field e:Landroid/graphics/drawable/Drawable;

.field f:I

.field g:Ljava/lang/Runnable;

.field h:Z


# direct methods
.method constructor <init>(Lcom/android/launcher3/model/data/y;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/views/FloatingIconView$b;->a:Lcom/android/launcher3/model/data/y;

    .line 5
    .line 6
    iput-boolean p2, p0, Lcom/android/launcher3/views/FloatingIconView$b;->b:Z

    .line 7
    .line 8
    return-void
.end method
