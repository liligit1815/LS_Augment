.class public Lcom/android/launcher3/anim/g0;
.super Ljava/lang/Object;
.source "SpringProperty.java"


# static fields
.field public static final d:Lcom/android/launcher3/anim/g0;


# instance fields
.field public final a:I

.field b:F

.field c:F


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/launcher3/anim/g0;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/launcher3/anim/g0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/android/launcher3/anim/g0;->d:Lcom/android/launcher3/anim/g0;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, v0}, Lcom/android/launcher3/anim/g0;-><init>(I)V

    return-void
.end method

.method public constructor <init>(I)V
    .locals 1

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/high16 v0, 0x3f000000    # 0.5f

    .line 3
    iput v0, p0, Lcom/android/launcher3/anim/g0;->b:F

    const v0, 0x44bb8000    # 1500.0f

    .line 4
    iput v0, p0, Lcom/android/launcher3/anim/g0;->c:F

    .line 5
    iput p1, p0, Lcom/android/launcher3/anim/g0;->a:I

    return-void
.end method


# virtual methods
.method public a(F)Lcom/android/launcher3/anim/g0;
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/anim/g0;->b:F

    .line 2
    .line 3
    return-object p0
.end method

.method public b(F)Lcom/android/launcher3/anim/g0;
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/anim/g0;->c:F

    .line 2
    .line 3
    return-object p0
.end method
