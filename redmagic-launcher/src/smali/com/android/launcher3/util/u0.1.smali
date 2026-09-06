.class public interface abstract Lcom/android/launcher3/util/u0;
.super Ljava/lang/Object;
.source "HorizontalInsettableView.java"


# static fields
.field public static final a:Landroid/util/FloatProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/FloatProperty<",
            "Lcom/android/launcher3/util/u0;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/launcher3/util/u0$a;

    .line 2
    .line 3
    const-string v1, "horizontalInsets"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lcom/android/launcher3/util/u0$a;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sput-object v0, Lcom/android/launcher3/util/u0;->a:Landroid/util/FloatProperty;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public abstract a()F
.end method

.method public abstract b(F)V
.end method
